class UserModel {
  int id;
  String userName;
  String nick;

  UserModel({this.id, this.userName, this.nick});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['username'];
    nick = json['nick'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.userName;
    data['nick'] = this.nick;

    return data;
  }
}
