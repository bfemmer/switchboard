class Unit {
  int? id;
  String? name;
  String? base;
  String? state;
  String? parent;
  String? link;
  String? facebook;
  double? lat;
  double? long;

  Unit(
      {this.base,
      this.id,
      this.link,
      this.parent,
      this.facebook,
      this.name,
      this.state});

  Unit.fromJson(Map<String, dynamic> json) {
    base = json['base'];
    id = json['id'];
    link = json['link'];
    parent = json['parent'];
    facebook = json['facebook'];
    name = json['name'];
    state = json['state'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base'] = base;
    data['id'] = id;
    data['link'] = link;
    data['parent'] = parent;
    data['facebook'] = facebook;
    data['name'] = name;
    data['state'] = state;
    data['lat'] = lat;
    data['long'] = long;
    return data;
  }
}
