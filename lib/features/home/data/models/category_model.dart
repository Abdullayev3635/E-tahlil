import 'package:hive/hive.dart';

part 'category_model.g.dart';

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

  CategoryModel({
    this.id,
    this.name,
    this.repetition,
    this.status,
    required this.isCheck,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    repetition = json['repetition'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['repetition'] = repetition;
    data['status'] = status;
    return data;
  }
}
