class Voters {
  String name;
  int order;
  int identification;
  bool state;
  int partnerId;


  Voters({
    required this.name,
    required this.order,
    required this.identification,
    required this.state,
    required this.partnerId,
  });

  factory Voters.fromJson(Map<String, dynamic> json){
    return Voters(
      name: json["name"],
      order: json["order"],
      partnerId: json["partner_id"],
      identification: json["identification"],
      state: json["state"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "order": order,
      "identification" : identification,
      "state" : state,
      "partner_id": partnerId,
    };
  }
}
