import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/api_cilent.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
Future<void> init() async {
//api client
  Get.lazyPut(() => ApiClinet(appBaseUrl: 'https://mvs.bslmeiyu.com'));

//repos
  Get.lazyPut(() => PopularProductRepo(apiClinet: Get.find()));

//controllers
 Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
