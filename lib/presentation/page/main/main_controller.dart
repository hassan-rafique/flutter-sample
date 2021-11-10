import 'package:get/get.dart';

class MainController extends GetxController {
  final RxInt selectedTabIndex = 0.obs;

  void onBottomNavSelection(int index) {
    selectedTabIndex.value = index;
  }
}
