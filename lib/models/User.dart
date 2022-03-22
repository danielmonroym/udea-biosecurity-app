import 'dart:convert';

class User {
  User({
    required this.idUser,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });

  String idUser;
  String name;
  String phone;
  String email;
  String address;

  factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json["idUser"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
      );
  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        idUser: json["idUser"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "name": name,
        "phone": phone,
        "email": email,
        "address": address,
      };
}
