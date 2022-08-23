class Resource {
  int? id;
  String? title;
  String? subTitle;
  String? description;
  String? imageUrl;
  String? linkUrl;
  String? pageRoute;
  DateTime? date;

  Resource(
      {
      this.id,
      this.title,
      this.subTitle,
      this.description,
      this.imageUrl,
      this.linkUrl,
      this.pageRoute,
      this.date});

  Resource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
    description = json['description'];
    linkUrl = json['linkUrl'];
    imageUrl = json['imageUrl'];
    pageRoute = json['pageRoute'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['description'] = description;
    data['linkUrl'] = linkUrl;
    data['imageUrl'] = imageUrl;
    data['pageRoute'] = pageRoute;
    data['date'] = date;
    return data;
  }
}
