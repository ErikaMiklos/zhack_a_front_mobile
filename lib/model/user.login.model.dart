class LoginModel {
  String? id;
  String? login;
  String? password;
  String? email;

  LoginModel({this.id, this.login, this.password, this.email});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }
}

  class User {
  User({
  required this.login,
  required this.id,
  required this.password,
  required this.email,
  });
  late final String login;
  late final int id;
  late final String password;
  late final String email;

  User.fromJson(Map<String, dynamic> json){
  login = json['login'];
  id = json['id'];
  password = json['password'];
  email = json['email'];
  }

  Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['login'] = login;
  _data['id'] = id;
  _data['password'] = password;
  _data['email'] = email;
  return _data;
  }
}