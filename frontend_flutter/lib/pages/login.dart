import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'globals.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController studentidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 400.0,
              height: 450.0,
              margin: EdgeInsets.only(left: 100),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.blue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/image1.png',
                          fit: BoxFit.contain,
                          height: 50,
                        ),
                        
                        Text(
                          'LoopLink',
                          style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.0),
                    Text(
                      'Welcome Back!',
                      style: GoogleFonts.lato(
                          fontStyle: FontStyle.normal, fontSize: 30),
                    ),
                  ]),
            ),
            Container(
              width: 400.0,
              height: 450.0,
              margin: EdgeInsets.only(right: (100)),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Log In Here',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'Get looped in a link',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Student Id',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              studentidController.text = value;
                              Globals.studentid = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15, width: 30),
                  Row(
                    children: [
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
                            "password": passwordController.text
                          };
                          var url = Uri.parse(
                              'https://au-socialnetwork-api.ew.r.appspot.com/login?student_id=${studentidController.text}&password=${passwordController.text}');
                          var response = await http.get(url);
                          if (response.statusCode == 200) {
                            Globals.studentid =
                                studentidController.text; // set global variable
                            Navigator.pushNamed(context, '/view_feed',
                                arguments: Globals.studentid);
                          } else {
                            throw Exception('Failed to log in profile');
                          }
                        },
                        child: Text('LOG IN'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                              text: "Don't have a Profile? ",
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.black, 
                              ),
                            ),
                            TextSpan(
                              text: "Create Profile",
                              style: const TextStyle(
                                fontSize: 10.0,
                                color: Colors.blue, 
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/create_profile');
                                },
                            ),
                          ],
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
