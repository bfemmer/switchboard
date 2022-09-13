class Guide {
  int? id;
  String? name;
  String? subtitle;
  String? description;
  String? signs;
  String? deployment;
  String? action;
  String? considerations;
  String? urlLink;

  Guide(
      {this.id,
      this.name,
      this.subtitle,
      this.description,
      this.signs,
      this.deployment,
      this.action,
      this.considerations,
      this.urlLink});

  Guide.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subtitle = json['subtitle'];
    description = json['description'];
    signs = json['signs'];
    deployment = json['deployment'];
    action = json['action'];
    considerations = json['considerations'];
    urlLink = json['urlLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['subtitle'] = subtitle;
    data['description'] = description;
    data['signs'] = signs;
    data['deployment'] = deployment;
    data['action'] = action;
    data['considerations'] = considerations;
    data['urlLink'] = urlLink;

    return data;
  }
}
