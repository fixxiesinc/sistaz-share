class EarlyAdopter {
  final String name, country, email;

  EarlyAdopter(
      {required this.name, required this.country, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'country': country,
      'email': email,
    };
  }
}
