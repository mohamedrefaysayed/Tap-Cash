class userDataModel {
  String? status;
  Data? date;

  userDataModel({this.status, this.date});

  userDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    date = json['date'] != null ? new Data.fromJson(json['date']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    return data;
  }
}

class Data {
  Wallet? wallet;

  Data({this.wallet});

  Data.fromJson(Map<String, dynamic> json) {
    wallet =
    json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    return data;
  }
}

class Wallet {
  int? balance;
  int? cashBack;
  int? limitPerTransaction;
  int? cashWithdrawalLimit;
  int? limitCash;
  String? sId;
  Owner? owner;
  String? createdAt;
  int? iV;

  Wallet(
      {this.balance,
        this.cashBack,
        this.limitPerTransaction,
        this.cashWithdrawalLimit,
        this.limitCash,
        this.sId,
        this.owner,
        this.createdAt,
        this.iV});

  Wallet.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    cashBack = json['cashBack'];
    limitPerTransaction = json['limitPerTransaction'];
    cashWithdrawalLimit = json['cashWithdrawalLimit'];
    limitCash = json['limitCash'];
    sId = json['_id'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    data['cashBack'] = this.cashBack;
    data['limitPerTransaction'] = this.limitPerTransaction;
    data['cashWithdrawalLimit'] = this.cashWithdrawalLimit;
    data['limitCash'] = this.limitCash;
    data['_id'] = this.sId;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Owner {
  String? photo;
  String? sId;
  String? fullName;
  String? nationalId;
  String? id;

  Owner({this.photo, this.sId, this.fullName, this.nationalId, this.id});

  Owner.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    sId = json['_id'];
    fullName = json['fullName'];
    nationalId = json['nationalId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['nationalId'] = this.nationalId;
    data['id'] = this.id;
    return data;
  }
}
