import 'package:udea_biosecurity_app/models/models.dart';

import '../../mocks/places_mock.dart';
import 'user_mock.dart';

class InvitationMock implements Invitation {
  @override
  DateTime inDate = new DateTime(2022, 4, 6, 17, 30);

  @override
  int invitationId = 1;

  @override
  DateTime outDate = new DateTime(2022, 4, 6, 18, 30);

  @override
  Places place = new MockPlaces();

  @override
  String placeId = "0";

  @override
  User user = new UserMock();

  @override
  String userId = "0";

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
