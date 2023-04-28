import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_flutter/pages/send_request.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProfile extends StatefulWidget {
  @override
  _createProfileState createState() => _createProfileState();
}

class _createProfileState extends State<CreateProfile> {
  final _formKey = GlobalKey<FormState>();
  
  TextEditingController studentidController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController yearGroupController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController liveOnCampusController = TextEditingController();
  TextEditingController bestFoodController = TextEditingController();
  TextEditingController bestMovieController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _major = 'Computer Science';
  String _residence = "Off-Campus";

  var course_items = [
    "Computer Science",
    "Business Administration",
    "Management Information Systems",
    "Electrical Engineering",
    "Mechanical Engineering",
    "Computer Engineering"
  ];

  var residence_items = ["Off-Campus", "On-Campus"];

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
      ),
      body: Center(
        child: Container(
          width: 800.0,
          height: 500.0,
          margin: EdgeInsets.all(50.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                    child:Text(
                      'Create New Connection',
                      style: GoogleFonts.lato(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: Colors.black),

                ),
              ),

              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          nameController.text = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          emailController.text = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Student ID',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          studentidController.text = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          dateOfBirthController.text = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Year Group',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          yearGroupController.text = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton<String>(
                      value: _major,
                      hint: Text("Select Major"),
                      items: course_items.map((String items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(
                            items,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        _major = newValue!;
                        setState(() {
                          majorController.text = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Best Food',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          bestFoodController.text = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Best Movie',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          bestMovieController.text = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: _residence,
                      hint: Text("Select Residence"),
                      items: residence_items.map((String items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(
                            items,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        _residence = newValue!;
                        setState(() {
                          liveOnCampusController.text = newValue;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          passwordController.text = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      Map<String, dynamic> body = {
                        "student_id": studentidController.text,
                        "name": nameController.text,
                        "email": emailController.text,
                        "date_of_birth": dateOfBirthController.text,
                        "year_group": yearGroupController.text,
                        "major": majorController.text,
                        "campus_residence": liveOnCampusController.text,
                        "best_food": bestFoodController.text,
                        "best_movie": bestMovieController.text,
                        "password": passwordController.text,
                      };
                      await createProfile(body);
                      Navigator.pushNamed(context, '/login');
                  },
                  child: Text('Submit'),
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
              SizedBox(height: 5),
                  Center(
                  child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Already have a Profile? ",
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.black, 
                              ),
                            ),
                            TextSpan(
                              text: "Log In",
                              style: const TextStyle(
                                fontSize: 10.0,
                                color: Colors.blue, 
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/login');
                                },
                            ),
                          ],
                        ),
                      ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
