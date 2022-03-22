import 'dart:convert';

import 'models.dart';

class Invitation {
  Invitation({
    required this.invitationId,
    required this.userId,
    required this.placeId,
    required this.inDate,
    required this.outDate,
    required this.user,
    required this.place,
  });

  int invitationId;
  String userId;
  String placeId;
  DateTime inDate;
  DateTime outDate;
  User user;
  Places place;

  factory Invitation.fromJson(Map<String, dynamic> json) => Invitation(
      invitationId: json["invitationId"],
      userId: json["userId"],
      placeId: json["placeId"],
      inDate: DateTime.parse(json["inDate"]),
      outDate: DateTime.parse(json["outDate"]),
      user: User.fromMap(json["user"]),
      place: Places.fromMap(json["place"]));

  String toJson() => json.encode(toMap());

  factory Invitation.fromMap(Map<String, dynamic> json) => Invitation(
        invitationId: json["invitationId"],
        userId: json["userId"],
        placeId: json["placeId"],
        inDate: DateTime.parse(json["inDate"]),
        outDate: DateTime.parse(json["outDate"]),
        user: User.fromMap(json["user"]),
        place: Places.fromMap(json["place"]),
      );

  Map<String, dynamic> toMap() => {
        "invitationId": invitationId,
        "userId": userId,
        "placeId": placeId,
        "inDate": inDate.toIso8601String(),
        "outDate": outDate.toIso8601String(),
        "user": user.toMap(),
        "place": place.toMap(),
      };
}
