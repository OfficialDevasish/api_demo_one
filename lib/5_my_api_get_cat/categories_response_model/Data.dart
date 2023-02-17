class Data {
  Data({
      this.id, 
      this.title, 
      this.image, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? title;
  String? image;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}