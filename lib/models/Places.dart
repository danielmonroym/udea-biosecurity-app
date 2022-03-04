import 'dart:convert';

class Places {
  Places({
    required this.idPlace,
    required this.namePlace,
    required this.phone,
    required this.address,
    required this.capacity,
    required this.actualCapacity,
    required this.checkIn,
    required this.checkOut,
  });

  String idPlace;
  String namePlace;
  String phone;
  String address;
  int capacity;
  int actualCapacity;
  String checkIn;
  String checkOut;

  factory Places.fromJson(String str) => Places.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Places.fromMap(Map<String, dynamic> json) => Places(
        idPlace: json["idPlace"],
        namePlace: json["namePlace"],
        phone: json["phone"],
        address: json["address"],
        capacity: json["capacity"],
        actualCapacity: json["actualCapacity"],
        checkIn: json["checkIn"],
        checkOut: json["checkOut"],
      );

  Map<String, dynamic> toMap() => {
        "idPlace": idPlace,
        "namePlace": namePlace,
        "phone": phone,
        "address": address,
        "capacity": capacity,
        "actualCapacity": actualCapacity,
        "checkIn": checkIn,
        "checkOut": checkOut,
      };
}
