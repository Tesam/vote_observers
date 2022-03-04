
class Table {
  String observer;
//  List<Voter> voters;
Table({required this.observer});
 // Table({required this.observer, required this.voters});

  factory Table.fromJson({required Map<String, dynamic> json}) {
    return Table(
      observer: json["observer"],
      /*voters: snapshot.data["voters"].map((data) {
        return Voter.fromSnapshot(data: data);
      }).toList(),*/
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '"user_id"': "",
    };
  }
}

class Voter {
  String name;
  String order;
  bool state;

  Voter({required this.name, required this.order, required this.state});

  factory Voter.fromSnapshot({required dynamic data}) {
    return Voter(
        name: data["name"], order: data["order"], state: data["state"]);
  }
}
