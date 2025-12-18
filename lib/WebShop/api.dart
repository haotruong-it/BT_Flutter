import 'package:dio/dio.dart';
import 'package:tonghop_baitap/WebShop/my_product.dart';

class API {
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    var response = await dio.get('https://fakestoreapi.com/products');

    List<Product> listProduct = [];

    if (response.statusCode == 200) {
      List data = response.data;

      // Chỉ lấy sản phẩm Electronics
      var electronics = data.where(
            (item) => item["category"] == "electronics",
      );

      listProduct = electronics.map((x) => Product.fromJson(x)).toList();
    }

    return listProduct;
  }
}

var testApi = API();
