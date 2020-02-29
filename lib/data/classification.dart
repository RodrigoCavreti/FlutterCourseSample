class Classification {
  final String category;
  final String name;

  Classification(this.category, this.name);

  factory Classification.fromJson(Map<String, dynamic> json) {
    return Classification(
      json['category'],
      json['name']
    );
  }

}