class User {
  final int userId;  // userId will be mapped to 'id'
  final String name;
  final String address;

  const User({
    required this.userId,
    required this.name,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json['id'],  // Map the backend 'id' to Dart 'userId'
    name: json['name'],
    address: json['address'],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "address": address,
  };
}
