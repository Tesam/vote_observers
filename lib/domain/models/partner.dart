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
      address: json["address"],
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
    };
  }
}
