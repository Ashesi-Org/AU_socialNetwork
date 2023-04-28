import 'package:flutter/material.dart';
import 'package:frontend_flutter/pages/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class Post {
  final String email;
  final String message;
  final DateTime timestamp;

  Post({required this.email, required this.message, required this.timestamp});
}

class ViewFeedPage extends StatefulWidget {
  final String studentid;

  ViewFeedPage({required this.studentid});

  @override
  _ViewFeedPageState createState() => _ViewFeedPageState();
}

class _ViewFeedPageState extends State<ViewFeedPage> {
  List<Post> _posts = [];

  Stream<List<Post>> _streamPosts() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 10)); // polling interval
      final response = await http.get(Uri.parse(
          'https://au-socialnetwork-api.ew.r.appspot.com/posts'));
      final postsJson = json.decode(response.body) as List<dynamic>;
      final posts = postsJson
          .map((json) => Post(
                email: json['email'],
                message: json['message'],
                timestamp: DateTime.parse(json['timestamp']),
              ))
          .toList();
      yield posts;
    }
  }

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
            Text('LoopLink',
                style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal,
                    fontSize: 25,
                    color: Colors.black)),
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
      body: Container(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/view_profile'),
                          icon: Icon(Icons.person, color: Colors.blue),
                          tooltip: 'View Profile',
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/create_post'),
                          icon: Icon(Icons.add, color: Colors.blue),
                          tooltip: 'Create Post',
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () async {
                        Globals.studentid = '';
                        print(Globals.studentid);
                        await Navigator.pushNamed(context, '/login');
                      },
                      icon: Icon(Icons.logout, color: Colors.blue),
                      tooltip: 'Logout',
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: StreamBuilder<List<Post>>(
                    stream: _streamPosts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        _posts = snapshot.data!;
                        return Center(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                            ),
                            itemCount: _posts.length,
                            itemBuilder: (context, index) {
                              return _buildPostCard(_posts[index]);
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostCard(Post post) {
    return Card(
      color: Colors.white.withOpacity(1),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.email,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 10.0),
            Text(post.message),
            SizedBox(height: 110.0),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                post.timestamp.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 10.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
