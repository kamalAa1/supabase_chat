class UserModel {
  String? id;
  String? name;
  String? email;

  UserModel({this.id, this.name, this.email});

  UserModel.fromJson(jsonData) {
    id = jsonData["id"].toString();
    name = jsonData["name"];
    email = jsonData["email"];
  }

  Map toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
