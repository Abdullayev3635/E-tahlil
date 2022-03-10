import 'package:hive/hive.dart';

part 'sub_category_model.g.dart';

@HiveType(typeId: 1)
class SubCategoryModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? categoryName;
  @HiveField(3)
  int? categoryId;
  @HiveField(4)
  int? countWorks;
  @HiveField(5)
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
