class CategoryModel {
  int? id;
  String? name;
  String? repetition;
  int? status;
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
