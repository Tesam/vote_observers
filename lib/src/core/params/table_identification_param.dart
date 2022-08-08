class TableIdentificationParam {
  String group;
  String state;
  String city;
  String place;
  String table;

  TableIdentificationParam({
    required this.group,
    required this.state,
    required this.city,
    required this.place,
    required this.table,
  });

  @override
  String toString() {
    return "$group$state$city$place$table";
  }
}
