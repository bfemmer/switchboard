class Hotline {
  int? id;
  String? name;
  String? description;
  String? phone;
  String? phoneType;
  String? link;

  Hotline(
      {this.description,
      this.id,
      this.link,
      this.name,
      this.phone,
      this.phoneType});

  Hotline.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    link = json['link'];
    name = json['name'];
    phone = json['phone'];
    phoneType = json['phone_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['id'] = id;
    data['link'] = link;
    data['name'] = name;
    data['phone'] = phone;
    data['phone_type'] = phoneType;
    return data;
  }
}
