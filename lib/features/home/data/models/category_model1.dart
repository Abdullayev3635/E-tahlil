import 'package:hive/hive.dart';

part 'category_model1.g.dart';

@HiveType(typeId: 0)
class CategoryModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? repetition;
  @HiveField(3)
  int? status;
  @HiveField(4)
  bool isCheck = false;
  @HiveField(5)
  int? count;
  @HiveField(6)
  String? description;

  CategoryModel({
    this.id,
    this.name,
    this.repetition,
    this.status,
    required this.isCheck,
    this.count,
    this.description,
  });


  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    repetition = json['repetition'];
    status = json['status'];
    count = json['count'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['repetition'] = repetition;
    data['status'] = status;
    data['count'] = count;
    data['description'] = description;
    return data;
  }
}
