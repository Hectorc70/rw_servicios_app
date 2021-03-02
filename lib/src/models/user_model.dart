class User {
  int id;
  String username;
  String token;
  String occupiedBy;
  String rol;

  User({this.id, 
        this.username, 
        this.token,
        this.occupiedBy,
        this.rol});

  factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
        id: data['id_user'],
        username: data['password'],
        token: data['token'],
        occupiedBy: data['occupied_by'],
        rol: data['rol'],
      );

  Map<String, dynamic> toDatabaseJson() =>
      {"id": this.id, 
      "username": this.username, 
      "token": this.token,
      "occupied_by": this.occupiedBy,
      "rol": this.rol};
}
