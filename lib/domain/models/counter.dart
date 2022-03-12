class Counter {
  int count;

  Counter({required this.count});

  factory Counter.fromJson(Map<String, dynamic> json){
    return Counter(
      count: json["count"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "count": count,
    };
  }
}