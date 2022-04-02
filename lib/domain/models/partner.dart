class Partner {
  String name;
  String city;
  int partnerIdentification;
  String subsidiary;
  int tableNumber;
  bool voteState;
  bool assigned;
  int partnerId;
  String address;
  String phone;
  int operatorIdentification;
  String operatorName;

  Partner({
    required this.name,
    required this.city,
    required this.partnerIdentification,
    required this.subsidiary,
    required this.tableNumber,
    required this.voteState,
    required this.assigned,
    required this.partnerId,
    required this.address,
    required this.phone,
    required this.operatorIdentification,
    required this.operatorName,
  });

  factory Partner.fromJson(Map<String, dynamic> json){
    return Partner(
      name: json["name"],
      city: json["city"],
      partnerIdentification: json["partner_identification"],
      subsidiary: json["subsidiary"],
      tableNumber: json["table_number"],
      voteState: json["vote_state"],
      assigned: json["assigned"],
      partnerId: json["partner_id"],
      address: json["address"].toString(),
      phone: json["phone"]??"",
      operatorIdentification: json["operator_identification"],
      operatorName: json["operator_name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "city": city,
      "partner_identification" : partnerIdentification,
      "subsidiary" : subsidiary,
      "table_number" : tableNumber,
      "vote_state" : voteState,
      "assigned": assigned,
      "partner_id" : partnerId,
      "address" : address,
      "phone": phone,
      "operator_identification": operatorIdentification,
      "operator_name": operatorName,
    };
  }
}
