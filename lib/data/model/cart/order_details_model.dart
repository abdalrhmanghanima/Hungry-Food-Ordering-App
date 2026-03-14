import 'package:hungry_app/data/model/cart/order_data.dart';

class OrderDetailsModel {
  int? code;
  String? message;
  OrderData? data;

  OrderDetailsModel({this.code, this.message, this.data});

  OrderDetailsModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? OrderData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }
}
