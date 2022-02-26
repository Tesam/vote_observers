class Operator {
  String name;
  String phone;
  String identification;
  int assignedQuantity;
  List<dynamic> assignedPartners;
  String partnerId;

  Operator({
    required this.name,
    required this.phone,
    required this.identification,
    this.assignedQuantity = 0,
    required this.assignedPartners,
    required this.partnerId,
  });

  factory Operator.fromJson(Map<String, dynamic> json){
    return Operator(
      name: json["name"],
      phone: json["phone"],
      identification: json["identification"],
      assignedQuantity: json["assigned_quantity"],
      assignedPartners: json["assigned_partners"],
      partnerId: json["partner_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "identification" : identification,
      "assigned_quantity" : assignedQuantity,
      "assigned_partners" : assignedPartners,
      "partner_id" : partnerId,
    };
  }
}
