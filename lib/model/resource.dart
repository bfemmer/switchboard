class Resource {
  int? id;
  String? name;
  String? type;
  String? level;
  String? description;
  String? link;
  String? voice;
  String? sms;
  String? icon;
  String? image;

  Resource(
      {this.description,
      this.id,
      this.level,
      this.link,
      this.voice,
      this.sms,
      this.name,
      this.type,
      this.icon,
      this.image});

  Resource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    level = json['level'];
    description = json['description'];
    link = json['link'];
    voice = json['voice'];
    sms = json['sms'];
    icon = json['icon'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['level'] = level;
    data['description'] = description;
    data['link'] = link;
    data['voice'] = voice;
    data['sms'] = sms;
    data['icon'] = icon;
    data['image'] = image;
    return data;
  }
}
