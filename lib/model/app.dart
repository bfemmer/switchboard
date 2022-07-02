class App {
  int? id;
  String? name;
  String? organization;
  String? description;
  String? applestore;
  String? playstore;
  String? icon;

  App(
      {this.id,
      this.name,
      this.organization,
      this.description,
      this.applestore,
      this.playstore,
      this.icon});

  App.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    organization = json['organization'];
    description = json['description'];
    applestore = json['applestore'];
    playstore = json['playstore'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['organization'] = organization;
    data['description'] = description;
    data['applestore'] = applestore;
    data['playstore'] = playstore;
    data['icon'] = icon;
    return data;
  }
}
