import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/core/values/colors.dart';
import 'package:flutter_sample_app/presentation/core/values/dimens.dart';
import 'package:flutter_sample_app/presentation/page/favorite/favorite_page.dart';
import 'package:flutter_sample_app/presentation/page/home/home_page.dart';
import 'package:flutter_sample_app/presentation/page/main/main_controller.dart';
import 'package:flutter_sample_app/presentation/util/constants.dart';
import 'package:flutter_sample_app/presentation/widget/profile_image.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ActionBar(),
            Expanded(
              child: Obx(
                () => IndexedStack(
                  index: controller.selectedTabIndex.value,
                  children: [
                    HomePage(),
                    FavoritePage(),
                    Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalMargin, vertical: kSpacing16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu),
          ProfileImage(kSampleImage),
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.find();
    return Obx(
      () => BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: kPrimaryColor,
        onTap: controller.onBottomNavSelection,
        currentIndex: controller.selectedTabIndex.value,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
