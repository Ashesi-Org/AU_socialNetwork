import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';
import 'package:frontend_flutter/pages/globals.dart';
import 'package:frontend_flutter/pages/post.dart';

String url_createProfile = 'https://au-socialnetwork-api.ew.r.appspot.com/users';

String url_editProfile = 'https://au-socialnetwork-api.ew.r.appspot.com/users';

String url_getProfile = 'https://au-socialnetwork-api.ew.r.appspot.com/users?student_id=' + Globals.studentid;

String url_login = 'https://au-socialnetwork-api.ew.r.appspot.com/login';

String url_createPost = 'https://au-socialnetwork-api.ew.r.appspot.com/posts?student_id=' + Globals.studentid;

String url_viewFeed = 'https://au-socialnetwork-api.ew.r.appspot.com/posts';

Future<int> createProfile(Map<String, dynamic> body) async {
  final uri = Uri.parse(url_createProfile);
  final headers = {'Content-Type': 'application/json'};
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');

  http.Response response = await http.post(
    uri,
    headers: headers,
    body: jsonBody,
    encoding: encoding,
  );

  if (response.statusCode == 200) {
    return response.statusCode;
  } else {
    String responseBody = response.body;
    int statusCode = response.statusCode;
    print(
        'Error creating profile. Status code: $statusCode. Response body: $responseBody');
    throw Exception('Failed to create profile');
  }
}

// edit profile
Future<int> editProfile(Map<String, dynamic> body) async {
  final uri = Uri.parse(url_editProfile);
  final headers = {'Content-Type': 'application/json'};
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');

  http.Response response = await http.patch(
    uri,
    headers: headers,
    body: jsonBody,
    encoding: encoding,
  );

  if (response.statusCode == 200) {
    return response.statusCode;
  } else {
    String responseBody = response.body;
    int statusCode = response.statusCode;
    print(
        'Error editing profile. Status code: $statusCode. Response body: $responseBody');
    throw Exception('Failed to edit profile');
  }
}


Future<User> getUser() async {
    final response = await http.get(Uri.parse(url_getProfile));
     if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }
}


Future<int> createPost(Map<String, dynamic> body) async {
  final uri = Uri.parse(url_createPost);
  final headers = {'Content-Type': 'application/json'};
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');

  http.Response response = await http.post(
    uri,
    headers: headers,
    body: jsonBody,
    encoding: encoding,
  );

  if (response.statusCode == 201) {
    return response.statusCode;
  } else {
    String responseBody = response.body;
    int statusCode = response.statusCode;
    print(
        'Error creating post. Status code: $statusCode. Response body: $responseBody');
    throw Exception('Failed to create post');
  }
}


