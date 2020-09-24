class UserModel {
  int id;
  String userName;
  String nick;

  UserModel({this.id, this.userName, this.nick});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    nick = json['nick'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['nick'] = this.nick;
    print(data);
    return data;
  }
}
