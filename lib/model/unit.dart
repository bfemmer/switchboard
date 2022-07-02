class Unit {
  int? id;
  String? name;
  String? base;
  String? state;
  String? link;

  Unit({this.base, this.id, this.link, this.name, this.state});

  Unit.fromJson(Map<String, dynamic> json) {
    base = json['base'];
    id = json['id'];
    link = json['link'];
    name = json['name'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base'] = base;
    data['id'] = id;
    data['link'] = link;
    data['name'] = name;
    data['state'] = state;
    return data;
  }
}
