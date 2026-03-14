import 'package:hungry_app/data/model/product_options/options_data.dart';

class SideOptionsModel {
  num? code;
  String? message;
  List<OptionData>? data;

  SideOptionsModel({this.code, this.message, this.data});

  SideOptionsModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(OptionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
