import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/base/base_page.dart';
import 'package:flutter_sample_app/presentation/core/values/dimens.dart';
import 'package:flutter_sample_app/presentation/core/values/strings.dart';
import 'package:flutter_sample_app/presentation/page/favorite/favorite_controller.dart';
import 'package:flutter_sample_app/presentation/widget/pet_card.dart';
import 'package:get/get.dart';

class FavoritePage extends BasePage<FavoriteController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.only(top: kSpacing10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalMargin),
            child: Text(
              'Your',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalMargin),
            child: Text(
              kLabelFavoritePets,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: kSpacing16),
          _PetsGridView(),
        ],
      ),
    );
  }
}

class _PetsGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = Get.find();
    return Obx(
      () => controller.favoritePets.isNotEmpty
          ? GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                  horizontal: kHorizontalMargin, vertical: kSpacing8),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemBuilder: (context, index) => PetCard(
                controller.favoritePets[index],
                onFavoriteTap: controller.onRemoveFavorite,
              ),
              itemCount: controller.favoritePets.length,
            )
          : Center(
              child: Text('No Pets in your list.'),
            ),
    );
  }
}
