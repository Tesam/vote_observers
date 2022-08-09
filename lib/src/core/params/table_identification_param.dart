class TableIdentificationParam {
  Map<String, dynamic> group;
  Map<String, dynamic> state;
  Map<String, dynamic> city;
  Map<String, dynamic> place;
  Map<String, dynamic> table;

  TableIdentificationParam({
    required this.group,
    required this.state,
    required this.city,
    required this.place,
    required this.table,
  });

  @override
  String toString() {
    return "${group['id']}${state['id']}${city['id']}${place['id']}${table['id']}";
  }
}
