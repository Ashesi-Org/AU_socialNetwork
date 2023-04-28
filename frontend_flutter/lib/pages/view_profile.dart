import 'package:flutter/material.dart';
import 'package:frontend_flutter/pages/globals.dart';
import 'package:frontend_flutter/pages/send_request.dart';
import 'package:frontend_flutter/pages/user.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProfile extends StatefulWidget {
  final String studentid;

  ViewProfile({required this.studentid});

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  late Future<User> viewUser;
  

  @override
  void initState() {
    super.initState();
    viewUser = getUser();
  }

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
              style: GoogleFonts.lato(
                  fontStyle: FontStyle.normal,
                  fontSize: 25,
                  color: Colors.black),
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
      body: SingleChildScrollView(
        child: FutureBuilder<User>(
          future: viewUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Use the user data to populate the text fields.
              nameController.text = snapshot.data!.name;
              emailController.text = snapshot.data!.email;
              dateOfBirthController.text = snapshot.data!.dateOfBirth;
              yearGroupController.text = snapshot.data!.yearGroup;
              majorController.text = snapshot.data!.major;
              liveOnCampusController.text = snapshot.data!.residence;
              bestFoodController.text = snapshot.data!.bestFood;
              bestMovieController.text = snapshot.data!.bestMovie;

              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.blue],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 1200),
                    child: Transform.translate(
                      offset: Offset(0, -100),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: Icon(
                                Icons
                                    .person, // use the person icon for the profile
                                color:
                                    Colors.white, // set the color of the icon
                                size: 200, // set the size of the icon
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, '/edit_profile', arguments: Globals.studentid),
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                    tooltip: 'Edit Profile',
                                  ),
                                  SizedBox(height: 30),
                                  IconButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, '/create_post'),
                                    icon: Icon(Icons.add, color: Colors.blue),
                                    tooltip: 'Create Post',
                                  ),
                                  SizedBox(height: 30),
                                  IconButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, '/view_feed'),
                                    icon: Icon(Icons.view_list,
                                        color: Colors.blue),
                                    tooltip: 'Feed',
                                  ),
                                  SizedBox(height: 30),
                                  IconButton(
                                    onPressed: () async {
                                      Globals.studentid = "";
                                      print(Globals.studentid);
                                      await Navigator.pushNamed(context, '/login');
                                    },
                                    icon:
                                        Icon(Icons.logout, color: Colors.blue),
                                    tooltip: 'Logout',
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -360),
                    child: Container(
                      margin: EdgeInsets.only(left: 200, bottom: 0),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 300,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildInfoContainer(
                                      'Name', nameController.text),
                                  _buildInfoContainer(
                                      'Email', emailController.text),
                                  _buildInfoContainer('Date of Birth',
                                      dateOfBirthController.text),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildInfoContainer(
                                      'Major', majorController.text),
                                  _buildInfoContainer(
                                      'Year Group', yearGroupController.text),
                                  _buildInfoContainer(
                                      'Residence', liveOnCampusController.text),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  _buildInfoContainer(
                                      'Best Food', bestFoodController.text),
                                  SizedBox(height: 20),
                                  _buildInfoContainer(
                                      'Best Movie', bestMovieController.text),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget _buildInfoContainer(String label, String value) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: GoogleFonts.lato(
              fontStyle: FontStyle.normal, fontSize: 16, color: Colors.black),
        ),
      ],
    ),
  );
}
