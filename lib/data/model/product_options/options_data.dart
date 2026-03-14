import 'package:hungry_app/domain/entities/product_options/product_options_entity.dart';

class OptionData {
  int? id;
  String? name;
  String? image;

  OptionData({this.id, this.name, this.image});

  OptionData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  OptionEntity toEntity() {
    return OptionEntity(id: id ?? 0, name: name ?? '', image: image ?? '');
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
