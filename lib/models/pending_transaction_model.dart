

class PendingTransactiontModel {
  String? status;
  List<Datum>? data;

  PendingTransactiontModel({
    this.status,
    this.data,
  });

  factory PendingTransactiontModel.fromJson(Map<String, dynamic> json) => PendingTransactiontModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? usersAgentsAccountsId;
  String? usersAgentsId;
  String? accountsHeadsId;
  String? description;
  String? txnType;
  String? txnDate;
  String? amount;
  String? image;
  String? status;

  Datum({
    this.usersAgentsAccountsId,
    this.usersAgentsId,
    this.accountsHeadsId,
    this.description,
    this.txnType,
    this.txnDate,
    this.amount,
    this.image,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    usersAgentsAccountsId: json["users_agents_accounts_id"],
    usersAgentsId: json["users_agents_id"],
    accountsHeadsId: json["accounts_heads_id"],
    description: json["description"],
    txnType: json["txn_type"],
    txnDate: json["txn_date"],
    amount: json["amount"],
    image: json["image"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "users_agents_accounts_id": usersAgentsAccountsId,
    "users_agents_id": usersAgentsId,
    "accounts_heads_id": accountsHeadsId,
    "description": description,
    "txn_type": txnType,
    "txn_date": txnDate,
    "amount": amount,
    "image": image,
    "status": status,
  };
}
