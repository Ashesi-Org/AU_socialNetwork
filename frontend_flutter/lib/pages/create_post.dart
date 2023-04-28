import 'package:flutter/material.dart';
import 'package:frontend_flutter/pages/send_request.dart';
import 'package:google_fonts/google_fonts.dart';


class CreatePost extends StatefulWidget {
    final String studentid;

    CreatePost({required this.studentid});

  @override
  _createPostState createState() => _createPostState();
}

class _createPostState extends State<CreatePost> {
  final _formKey = GlobalKey<FormState>();
    TextEditingController messageController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/image1.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Text(
              'LoopLink',
              style: GoogleFonts.lato(fontStyle: FontStyle.normal, fontSize: 25, color: Colors.black)
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:Center(
      child :Container(
        width: 800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 50),
          Row(
          children: [
            SizedBox(width: 32),
            IconButton(
              onPressed: () =>
              Navigator.pushNamed(context, '/view_profile'),
              icon: Icon(Icons.person, color: Colors.blue),
              tooltip: 'View Profile',
            ),
          SizedBox(width: 30),
            IconButton(
              onPressed: () =>
              Navigator.pushNamed(context, '/view_feed'),
              icon: Icon(Icons.view_list, color: Colors.blue),
              tooltip: 'Feed',
            ),
          ]
          ),
          SizedBox(height: 30),
          Container(
            
  height: 400,
  margin: EdgeInsets.symmetric(horizontal: 32),
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
    borderRadius: BorderRadius.circular(8),
  ),
  child: Column(
    children: [
      SizedBox(height: 150),
      TextField(
        controller: messageController,
        decoration: InputDecoration(
          hintText: "What's on your mind?",
        ),
      ),
      SizedBox(height: 50),
       ElevatedButton(
                    onPressed: () async {

                      Map<String, dynamic> body = {
                      "message": messageController.text,
                      };
                      await createPost(body);
                      Navigator.pushNamed(context, '/view_feed');
                  },
                  child: Text('POST'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
      ),
    );
  }
}


