import 'package:flutter/material.dart';
import 'package:flutter_sample_app/domain/entity/pet.dart';
import 'package:flutter_sample_app/presentation/base/base_page.dart';
import 'package:flutter_sample_app/presentation/core/route/app_routes.dart';
import 'package:flutter_sample_app/presentation/core/values/colors.dart';
import 'package:flutter_sample_app/presentation/core/values/dimens.dart';
import 'package:flutter_sample_app/presentation/core/values/strings.dart';
import 'package:flutter_sample_app/presentation/page/home/home_controller.dart';
import 'package:flutter_sample_app/presentation/widget/pet_card.dart';
import 'package:get/get.dart';

class HomePage extends BasePage<HomeController> {
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
              kLabelFindYour,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalMargin),
            child: Text(
              kLabelAwesomePet,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: kSpacing16),
          _CategoriesListView(),
          const SizedBox(height: kSpacing16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Newest Pet',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          const SizedBox(height: kSpacing8),
          _PetsGridView(),
        ],
      ),
    );
  }
}

class _CategoriesListView extends StatelessWidget {
  final _lastSelectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return SizedBox(
      height: 65,
      child: Obx(
        () => ListView.builder(
          padding:
              EdgeInsets.symmetric(horizontal: kSpacing16, vertical: kSpacing8),
          clipBehavior: Clip.hardEdge,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              _lastSelectedIndex.value = index;
            },
            child: Obx(
              () => _CategoryCard(
                controller.categories[index],
                selected: _lastSelectedIndex.value == index,
              ),
            ),
          ),
          itemCount: controller.categories.length,
        ),
      ),
    );
  }
}

class _PetsGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Obx(
      () => controller.pets.isNotEmpty
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
              itemBuilder: (context, index) => GestureDetector(
                child: PetCard(
                  controller.pets[index],
                  onFavoriteTap: (pet) {
                    controller.onFavoriteToggle(pet);
                  },
                ),
                onTap: () {
                  _onPetCardTap(controller.pets[index]);
                },
              ),
              itemCount: controller.pets.length,
            )
          : Center(
              child: Text('Loading data please wait...'),
            ),
    );
  }

  _onPetCardTap(Pet pet) {
    Get.toNamed(Routes.PET_DETAIL, arguments: pet);
  }
}

class _CategoryCard extends StatelessWidget {
  final bool selected;
  final String categoryText;

  _CategoryCard(this.categoryText, {this.selected = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing4),
        child: Card(
          elevation: kSpacing10,
          shadowColor: Colors.white54,
          color: selected ? kPrimaryColor : Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(kSpacing8))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSpacing8),
            child: Center(
              child: Text(
                categoryText,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: selected ? Colors.white : Colors.black87,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
