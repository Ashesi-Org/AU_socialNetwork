class User {
  final String studentid;
  final String name;
  final String email;
  final String dateOfBirth;
  final String yearGroup;
  final String major;
  final String residence;
  final String bestFood;
  final String bestMovie;

  User({
    required this.studentid,
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.yearGroup,
    required this.major,
    required this.residence,
    required this.bestFood,
    required this.bestMovie,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      studentid: json['student_id'],
      name: json['name'],
      email: json['email'],
      dateOfBirth: json['date_of_birth'],
      yearGroup: json['year_group'],
      major: json['major'],
      residence: json['campus_residence'],
      bestFood: json['best_food'],
      bestMovie: json['best_movie'],
    );
  }
}
