import 'package:hungry_app/domain/entities/home/products_entity.dart';
class ProductsModel extends ProductsEntity {
  ProductsModel({
    int? code,
    String? message,
    List<ProductModel>? data,
  }) : super(
    code: code,
    message: message,
    data: data,
  );

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      code: json['code'],
      message: json['message'],
      data: json['data'] != null
          ? List<ProductModel>.from(
        json['data'].map((x) => ProductModel.fromJson(x)),
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
        data!.map((x) => (x as ProductModel).toJson()),
      )
          : [],
    };
  }
}

class ProductModel extends ProductEntity {
  ProductModel({
    int? id,
    String? name,
    String? description,
    String? image,
    String? rating,
    String? price,
  }) : super(
    id: id,
    name: name,
    description: description,
    image: image,
    rating: rating,
    price: price,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      rating: json['rating'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "image": image,
      "rating": rating,
      "price": price,
    };
  }
}