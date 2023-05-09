class verfiySignUpModel {
  String? status;
  String? token;

  verfiySignUpModel({this.status, this.token});

  verfiySignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    return data;
  }
}
