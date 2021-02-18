

/* UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson()); */

class UserModel {
  String idUser;
  String password;
  String occupiedBy;

  UserModel({
    this.idUser,
    this.password,
    this.occupiedBy,

  });
}
