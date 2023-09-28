class User {
  String name, sex, profilePic;
  int age;
  Map<String, List<dynamic>> review;

  User.fromMap(Map<String, dynamic> userMap)
      : name = userMap['name'],
        sex = userMap['sex'],
        profilePic = userMap['profilePic'],
        age = userMap['age'],
        review = userMap['review'];
}

// class Review {
//   int score;
//   String content;

//   Review({required this.score, required this.content});
// }
