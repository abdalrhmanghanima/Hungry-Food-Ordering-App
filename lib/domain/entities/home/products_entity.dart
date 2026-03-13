class ProductsEntity {
  final int? code;
  final String? message;
  final List<ProductEntity>? data;

  ProductsEntity({
    this.code,
    this.message,
    this.data,
  });
}

class ProductEntity {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final String? rating;
  final String? price;

  ProductEntity({
    this.id,
    this.name,
    this.description,
    this.image,
    this.rating,
    this.price,
  });
}