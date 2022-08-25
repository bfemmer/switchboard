class Skill {
  int? id;
  String? skill;
  String? description;
  String? usage;

  Skill({
    this.id,
    this.skill,
    this.description,
    this.usage,
  });

  Skill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skill = json['skill'];
    description = json['description'];
    usage = json['usage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['skill'] = skill;
    data['description'] = description;
    data['usage'] = usage;
    return data;
  }
}
