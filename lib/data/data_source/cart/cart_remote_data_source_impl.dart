import 'package:dio/dio.dart';
import 'package:hungry_app/core/constants/api_endpoints.dart';
import 'package:hungry_app/data/data_source/cart/cart_remote_data_source.dart';
import 'package:hungry_app/data/model/cart/order_details_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio dio;

  CartRemoteDataSourceImpl(this.dio);

  @override
  Future<void> addToCart({
    required int productId,
    required int quantity,
    required double spicy,
    required List<int> toppings,
    required List<int> sides,
  }) async {
    await dio.post(
      ApiConstants.addToCart,
      data: {
        "items": [
          {
            "product_id": productId,
            "quantity": quantity,
            "spicy": spicy,
            "toppings": toppings,
            "side_options": sides,
          },
        ],
      },
    );
  }

  @override
  Future<OrderDetailsModel> getCart() async {
    final response = await dio.get(ApiConstants.getCart);

    return OrderDetailsModel.fromJson(response.data);
  }

  @override
  Future<void> deleteCartItem(int itemId) async {
    await dio.delete('${ApiConstants.deleteFromCart}$itemId');
  }
}
