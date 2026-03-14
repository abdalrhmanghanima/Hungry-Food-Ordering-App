import 'package:hungry_app/data/model/cart/order_item.dart';

class OrderData {
  int? id;
  String? totalPrice;
  List<OrderItem>? items;

  OrderData({this.id, this.totalPrice, this.items});

  OrderData.fromJson(dynamic json) {
    id = json['id'];
    totalPrice = json['total_price'];

    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(OrderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['id'] = id;
    map['total_price'] = totalPrice;

    if (items != null) {
      map['items'] = items!.map((v) => v.toJson()).toList();
    }

    return map;
  }
}
