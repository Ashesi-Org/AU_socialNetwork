import 'package:flutter/material.dart';
import 'package:frontend_flutter/pages/create_profile.dart';
import 'package:frontend_flutter/pages/edit_profile.dart';
import 'package:frontend_flutter/pages/globals.dart';
import 'package:frontend_flutter/pages/view_profile.dart';
import 'package:frontend_flutter/pages/login.dart';
import 'package:frontend_flutter/pages/create_post.dart';
import 'package:frontend_flutter/pages/view_feed.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LoopLink',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/create_profile': (context) => CreateProfile(),
        '/edit_profile': (context) => EditProfile(studentid: Globals.studentid),
        '/view_profile': (context) => ViewProfile(studentid: Globals.studentid),
        '/login': (context) => Login(),
        '/create_post': (context) => CreatePost(studentid: Globals.studentid),
        '/view_feed': (context) => ViewFeedPage(studentid: Globals.studentid),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          width: 550.0,
          height: 500.0,
          margin: EdgeInsets.all(50.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children:[
              Positioned(
                top: 100.0,
                left: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
              'assets/images/image1.png',
              fit: BoxFit.contain,
              height: 80,
            ),
            SizedBox(height: 20),
                  Text(
                    'Welcome to Ashesi\'s LoopLink',
                    style: GoogleFonts.lato(fontStyle: FontStyle.normal, fontSize: 25),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Get linked up and stay looped in the network!',
                    style: GoogleFonts.lato(fontStyle: FontStyle.normal, fontSize: 12),
                  ),
                  SizedBox(height: 50),
                  
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
  ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, '/create_profile');
    },
    child: Text('SIGN UP'),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
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
  SizedBox(width: 16.0),
  ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, '/login');
    },
    child: Text('LOG IN'),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
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
