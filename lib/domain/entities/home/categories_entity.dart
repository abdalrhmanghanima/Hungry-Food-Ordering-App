class CategoriesEntity {
  final int? code;
  final String? message;
  final List<CategoryEntity>? data;

  CategoriesEntity({
    this.code,
    this.message,
    this.data,
  });
}

class CategoryEntity {
  final int? id;
  final String? name;

  CategoryEntity({
    this.id,
    this.name,
  });
}