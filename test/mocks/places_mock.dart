import 'package:udea_biosecurity_app/models/models.dart';

class MockPlaces implements Places {
  @override
  int actualCapacity = 1;

  @override
  String address = "Test Address";

  @override
  int capacity = 420;

  @override
  String checkIn = "12:30";

  @override
  String checkOut = "12:40";

  @override
  String idPlace = "667";

  @override
  String namePlace = "Test Place";

  @override
  String phone = "Test Phone";

  @override
  String toJson() {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }

  @override
  String imgUrl = "https://i.imgur.com/UrKw0IY.jpg";
}
