class Feed {
  int? id;
  String? date;
  String? title;
  String? subtitle;
  String? description;
  String? imageUrl;
  String? linkUrl;
  int? sortOrder;

  Feed({
    this.id,
    this.date,
    this.title,
    this.subtitle,
    this.description,
    this.imageUrl,
    this.linkUrl,
    this.sortOrder,
  });

  Feed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    linkUrl = json['linkUrl'];
    imageUrl = json['imageUrl'];
    sortOrder = json['sortOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['date'] = date;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['description'] = description;
    data['linkUrl'] = linkUrl;
    data['imageUrl'] = imageUrl;
    data['sortOrder'] = sortOrder;

    return data;
  }
}
