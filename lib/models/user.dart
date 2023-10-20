class User {
  final String id;
  final String secret;
  final String createdAt;
  final String username;
  final String ageGroup;
  final String country;
  final String education;
  final String gender;
  final String preferredCounsellor;
  User({
    required this.id,
    required this.secret,
    required this.createdAt,
    required this.username,
    required this.ageGroup,
    required this.country,
    required this.education,
    required this.gender,
    required this.preferredCounsellor,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'secret': secret,
      'created_at': createdAt,
      'username': username,
      'age_group': ageGroup,
      'country': country,
      'education': education,
      'gender': gender,
      'preferred_counsellor': preferredCounsellor,
    };
  }

  factory User.fromMap(Map map) {
    return User(
      id: map['id'],
      secret: map['secret'],
      createdAt: map['created_at'],
      username: map['username'],
      ageGroup: map['age_group'],
      country: map['country'],
      education: map['education'],
      gender: map['gender'],
      preferredCounsellor: map['preferred_counsellor'],
    );
  }
}
