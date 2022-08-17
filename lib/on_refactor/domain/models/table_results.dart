class TableResults {
  int count;

  TableResults({required this.count});

  factory TableResults.fromJson(Map<String, dynamic> json){
    return TableResults(
      count: json["count"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "count": count,
    };
  }
}