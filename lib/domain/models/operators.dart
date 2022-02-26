class Operator {
  String name;
  String phone;
  String identification;
  int assignedQuantity;
  List<dynamic> assignedPartners;

  Operator({
    required this.name,
    required this.phone,
    required this.identification,
    this.assignedQuantity = 0,
    required this.assignedPartners,
  });

  factory Operator.fromJson(Map<String, dynamic> json){
    return Operator(
      name: json["name"],
      phone: json["phone"],
      identification: json["identification"],
      assignedQuantity: json["assigned_quantity"],
      assignedPartners: json["assigned_partners"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '"name"': '"$name"',
      '"phone"': '"$phone"',
      '"identification"' : '"$identification"',
      '"assigned_quantity"' : '"$assignedQuantity"',
      '"assigned_partners"' : '"$assignedPartners"',
    };
  }
}
