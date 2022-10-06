import 'package:food_delivery/data/api_cilent.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClinet apiClinet;
  PopularProductRepo({required this.apiClinet});

  Future<Response> getPopularProductList() async {
    return await apiClinet.getData('/api/v1/products/popular');
  }
}
