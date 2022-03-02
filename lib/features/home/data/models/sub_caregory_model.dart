class SubCategoryModel {
  int? id;
  String? name;
  int? categoryId;
  String? status;

  SubCategoryModel({this.id, this.name, this.categoryId, this.status});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['status'] = status;
    return data;
  }
}
