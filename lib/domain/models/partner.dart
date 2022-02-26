class Partner {
  String name;
  String city;
  String identification;
  String subsidiary;
  String tableNumber;
  bool voteState;

  Partner({
    required this.name,
    required this.city,
    required this.identification,
    required this.subsidiary,
    required this.tableNumber,
    required this.voteState,
  });

  factory Partner.fromJson(Map<String, dynamic> json){
    return Partner(
      name: json["name"],
      city: json["city"],
      identification: json["identification"],
      subsidiary: json["subsidiary"],
      tableNumber: json["table_number"],
      voteState: json["vote_state"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '"name"': '"$name"',
      '"city"': '"$city"',
      '"identification"' : '"$identification"',
      '"subsidiary"' : '"$subsidiary"',
      '"table_number"' : '"$tableNumber"',
      '"vote_state"' : '"$voteState"',
    };
  }
}
