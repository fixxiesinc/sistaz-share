class Counsellor {
  final String id;
  final String name;
  final String avatarUrl;
  Counsellor({
    required this.id,
    required this.name,
    required this.avatarUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'avatar_url': avatarUrl,
    };
  }

  factory Counsellor.fromMap(Map map) {
    return Counsellor(
      id: map['id'],
      name: map['name'],
      avatarUrl: map['avatar_url'],
    );
  }
}
