import 'package:udea_biosecurity_app/models/models.dart';

class UserMock implements User {
  @override
  String address = "123";

  @override
  String email = "123@gmail.com";

  @override
  String idUser = "0";

  @override
  String name = "mock";

  @override
  String phone = "123123";

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
