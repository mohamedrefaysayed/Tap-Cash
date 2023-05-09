
class signInModel {
  String? status;
  String? token;
  Data? data;

  signInModel({this.status, this.token, this.data});

  signInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class User {
  String? photo;
  String? role;
  String? sId;
  String? email;
  String? passwordChangedAt;
  String? age;
  String? birthDate;
  String? city;
  String? fullName;
  String? gender;
  String? nationalId;
  String? nickName;
  String? phoneNumber;

  User(
      {this.photo,
        this.role,
        this.sId,
        this.email,
        this.passwordChangedAt,
        this.age,
        this.birthDate,
        this.city,
        this.fullName,
        this.gender,
        this.nationalId,
        this.nickName,
        this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    role = json['role'];
    sId = json['_id'];
    email = json['email'];
    passwordChangedAt = json['passwordChangedAt'];
    age = json['age'];
    birthDate = json['birthDate'];
    city = json['city'];
    fullName = json['fullName'];
    gender = json['gender'];
    nationalId = json['nationalId'];
    nickName = json['nickName'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photo'] = photo;
    data['role'] = role;
    data['_id'] = sId;
    data['email'] = email;
    data['passwordChangedAt'] = passwordChangedAt;
    data['age'] = age;
    data['birthDate'] = birthDate;
    data['city'] = city;
    data['fullName'] = fullName;
    data['gender'] = gender;
    data['nationalId'] = nationalId;
    data['nickName'] = nickName;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}

