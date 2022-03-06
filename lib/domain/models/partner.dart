class Partner {
  String name;
  String city;
  int identification;
  String subsidiary;
  int tableNumber;
  bool voteState;
  bool assigned;
  int partnerId;
  String address;
  String phone;

  Partner({
    required this.name,
    required this.city,
    required this.identification,
    required this.subsidiary,
    required this.tableNumber,
    required this.voteState,
    required this.assigned,
    required this.partnerId,
    required this.address,
    required this.phone,
  });

  factory Partner.fromJson(Map<String, dynamic> json){
    return Partner(
      name: json["name"],
      city: json["city"],
      identification: json["identification"],
      subsidiary: json["subsidiary"],
      tableNumber: json["table_number"],
      voteState: json["vote_state"],
      assigned: json["assigned"],
      partnerId: json["partner_id"],
      address: json["address"].toString(),
      phone: json["phone"]??"",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "city": city,
      "identification" : identification,
      "subsidiary" : subsidiary,
      "table_number" : tableNumber,
      "vote_state" : voteState,
      "assigned": assigned,
      "partner_id" : partnerId,
      "address" : address,
      "phone": phone,
    };
  }
}
