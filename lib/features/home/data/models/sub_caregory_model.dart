class SubCategoryModel {
  int? id;
  String? name;
  String? categoryName;
  int? categoryId;
  int? countWorks;
  String? status;

  SubCategoryModel(
      {this.id,
      this.name,
      this.categoryName,
      this.categoryId,
      this.countWorks,
      this.status});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    countWorks = json['count_works'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_name'] = categoryName;
    data['category_id'] = categoryId;
    data['count_works'] = countWorks;
    data['status'] = status;
    return data;
  }
}
