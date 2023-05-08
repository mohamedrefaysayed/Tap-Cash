
class signInModel {
  String? status;
  String? token;
  Data? data;

  signInModel({this.status, this.token, this.data});

  signInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['passwordChangedAt'] = this.passwordChangedAt;
    data['age'] = this.age;
    data['birthDate'] = this.birthDate;
    data['city'] = this.city;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['nationalId'] = this.nationalId;
    data['nickName'] = this.nickName;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}

