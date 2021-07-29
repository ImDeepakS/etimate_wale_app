class User {
  final String username, email, phone, password, zipcode, address;

  User({
    required this.address,
    required this.email,
    required this.password,
    required this.phone,
    required this.username,
    required this.zipcode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      zipcode: json['zipcode'],
      address: json['address'],
    );
  }
}
