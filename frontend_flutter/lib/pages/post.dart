class Post {
  final String email;
  final String timestamp;
  final String message;

  Post({
    required this.email,
    required this.timestamp,
    required this.message,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      email: json['email'],
      timestamp: json['date_of_birth'],
      message: json['year_group'],
    );
  }
}
