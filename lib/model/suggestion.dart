class Suggestion {
  late String name;

  Suggestion({
    required this.name,
  });

  Suggestion.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    return data;
  }
}
