import 'package:hungry_app/data/model/cart/option_model.dart';

class OrderItem {
  int? itemId;
  int? productId;
  String? name;
  String? image;
  int? quantity;
  String? price;
  dynamic spicy;

  List<OptionModel>? toppings;
  List<OptionModel>? sideOptions;

  OrderItem({
    this.itemId,
    this.productId,
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.spicy,
    this.toppings,
    this.sideOptions,
  });

  OrderItem.fromJson(dynamic json) {
    itemId = json['item_id'];
    productId = json['product_id'];
    name = json['name'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
    spicy = json['spicy'];

    if (json['toppings'] != null) {
      toppings = [];
      json['toppings'].forEach((v) {
        toppings!.add(OptionModel.fromJson(v));
      });
    }

    if (json['side_options'] != null) {
      sideOptions = [];
      json['side_options'].forEach((v) {
        sideOptions!.add(OptionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['item_id'] = itemId;
    map['product_id'] = productId;
    map['name'] = name;
    map['image'] = image;
    map['quantity'] = quantity;
    map['price'] = price;
    map['spicy'] = spicy;

    if (toppings != null) {
      map['toppings'] = toppings!.map((v) => v.toJson()).toList();
    }

    if (sideOptions != null) {
      map['side_options'] = sideOptions!.map((v) => v.toJson()).toList();
    }

    return map;
  }
}
