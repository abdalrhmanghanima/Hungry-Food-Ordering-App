import 'package:hungry_app/domain/entities/home/categories_entity.dart';
class CategoriesModel extends CategoriesEntity {
  CategoriesModel({
    int? code,
    String? message,
    List<CategoryModel>? data,
  }) : super(
    code: code,
    message: message,
    data: data,
  );

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      code: json['code'],
      message: json['message'],
      data: json['data'] != null
          ? List<CategoryModel>.from(
        json['data'].map((x) => CategoryModel.fromJson(x)),
      )
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
      "data": data != null
          ? List<dynamic>.from(
        data!.map((x) => (x as CategoryModel).toJson()),
      )
          : [],
    };
  }
}

class CategoryModel extends CategoryEntity {
  CategoryModel({
    int? id,
    String? name,
  }) : super(
    id: id,
    name: name,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}