class Guide {
  int? id;
  String? name;
  String? subtitle;
  String? description;
  String? stress;
  String? signs;
  String? deployment;
  String? riskFactors;
  String? vigilance;
  String? action;
  String? assistance;
  String? considerations;
  String? urlLink;

  Guide(
      {this.id,
      this.name,
      this.subtitle,
      this.description,
      this.stress,
      this.signs,
      this.deployment,
      this.riskFactors,
      this.vigilance,
      this.action,
      this.assistance,
      this.considerations,
      this.urlLink});

  Guide.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subtitle = json['subtitle'];
    description = json['description'];
    stress = json['stress_sources'];
    signs = json['signs'];
    deployment = json['deployment'];
    riskFactors = json['risk_factors'];
    vigilance = json['vigilance'];
    action = json['action'];
    assistance = json['assistance'];
    considerations = json['considerations'];
    urlLink = json['urlLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['subtitle'] = subtitle;
    data['description'] = description;
    data['stress_sources'] = stress;
    data['signs'] = signs;
    data['deployment'] = deployment;
    data['risk_factors'] = riskFactors;
    data['vigilance'] = vigilance;
    data['action'] = action;
    data['assistance'] = assistance;
    data['considerations'] = considerations;
    data['urlLink'] = urlLink;

    return data;
  }
}
