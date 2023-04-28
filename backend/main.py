import json, bcrypt, datetime, smtplib
from flask import Flask, request, jsonify
from firebase_admin import credentials, firestore, initialize_app
import functions_framework
import asyncio
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

#initializing database
cred = credentials.Certificate("key.json")
firebase_app = initialize_app(cred)
db = firestore.client()

users = db.collection('users')
posts = db.collection('posts')

"""
This function creates a new user
"""
@app.route('/users', methods=['POST'])
def create_profile():
    record = json.loads(request.data)
    user_ref = users.document(str(record['student_id']))
    if user_ref.get().exists:
        return jsonify({"error": "You already have a profile"}), 400
    
    user_ref.set(record)
    return jsonify(record)


"""
This function allows an exixting user to log in with their studentid and password
"""
@app.route('/login', methods=['GET'])
def login_profile():
    student_id = request.args.get('student_id')
    password = request.args.get('password')

    # check if student id and password are provided
    if not student_id or not password:
        return jsonify({"Error": "Please provide student ID and password"}), 400

    # check if user exists and password is correct
    user_ref = users.document(str(student_id))
    user_data = user_ref.get().to_dict()
    if user_data and user_data['password'] == password:
        return jsonify({"message": "Login successful"}), 200
    else:
        return jsonify({"Error": "Invalid student ID or password"}), 401


"""
This function allows a user to edit their data except for their studentid, email, and name
"""
@app.route('/users', methods=['PATCH'])
def edit_profile():
    record = json.loads(request.data)
    user_ref = users.document(str(record['student_id']))
    if user_ref.get().exists:
        user_ref.update({'date_of_birth': record['date_of_birth'],
                         'year_group': record['year_group'], 'major': record['major'],
                         'campus_residence': record['campus_residence'],
                         'best_food': record['best_food'], 'best_movie': record['best_movie']})
        return jsonify(record)
    else:
        return jsonify({"Error": "Data not found"}), 404


"""
This function allows a user to view their profile with all their data except studentid and password
"""
@app.route('/users', methods=['GET'])
def view_profile():
    student_id = request.args.get('student_id')
    user_ref = users.document(str(student_id))
    user = user_ref.get()
    if user.exists:
        user_dict = user.to_dict()
        del user_dict['password']  # remove the password field
        return jsonify(user_dict)
    else:
        return jsonify({"Error": "User not found"}), 404


"""
This function allows a user to create a post
"""
@app.route('/posts', methods=['POST'])
def create_post():
    record = json.loads(request.data)
    message = record.get('message')
    student_id = request.args.get('student_id')
    
    # validating input
    if not message:
        return jsonify({"Error": "Message is required"})
    
    # get user data and email
    user_ref = users.document(str(student_id))
    user_data = user_ref.get().to_dict()
    email = user_data['email']
    
    # add timestamp
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    # create post document with timestamp
    post_ref = posts.document()
    post_ref.set({
        'email': email,
        'message': message,
        'timestamp': timestamp
    })
    
    # retrieve all emails
    all_users = users.stream()
    emails = [user.to_dict()['email'] for user in all_users if user.to_dict()['email'] != email]
    
    for email_address in emails:
        print(email_address)
        send_email(email_address)
        
    #return response with timestamp
    record['timestamp'] = timestamp
    return jsonify({"message": "Post created successfully"}), 201


"""
This function allows a user to view their feed with all posts from all users
from the most recent post and in realtime with any new post
"""
@app.route('/posts', methods=['GET'])
def view_feed():
    posts_ref = db.collection('posts').order_by('timestamp', direction=firestore.Query.DESCENDING)
    all_posts = [doc.to_dict() for doc in posts_ref.stream()]

    if len(all_posts) > 0:
        return jsonify(all_posts)
    else:
        return jsonify({"Error": "No posts found"}), 404


"""
This functions sends an email to all users except the user who created the post
 and it uses firebase email trigger
"""
def send_email(user_email):
    email_docs = db.collection('mail').get()
    data = {
        "to": user_email,
        "message": {
            "subject": "Ashesi Connect",
            "html": "A new message has been posted",
        }
    }
    
    db.collection('mail').document("Dn3U0fVgxpmyLe2vCiSN").set(data)