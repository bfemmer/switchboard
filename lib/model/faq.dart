class Faq {
  int? id;
  String? question;
  String? response;

  Faq({
    this.id,
    this.question,
    this.response,
  });

  Faq.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['question'] = question;
    data['response'] = response;
    return data;
  }
}
