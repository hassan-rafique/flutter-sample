import 'package:flutter/material.dart';
import 'package:flutter_sample_app/domain/entity/pet.dart';
import 'package:flutter_sample_app/presentation/core/values/colors.dart';
import 'package:flutter_sample_app/presentation/core/values/dimens.dart';
import 'package:flutter_sample_app/presentation/util/constants.dart';
import 'package:get/get.dart';

class PetCard extends StatelessWidget {
  final Pet _pet;
  final Function(Pet)? onFavoriteTap;
  late RxBool _favorite;

  PetCard(this._pet, {this.onFavoriteTap}) {
    _favorite = RxBool(_pet.favorite);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: kSpacing8,
      shadowColor: Colors.white54,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(kSpacing16))),
      child: Padding(
        padding: const EdgeInsets.all(kSpacing8),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.only(right: kSpacing8),
                      child: Image.network(_pet.image),
                    ),
                  ),
                  Positioned(
                    child: GestureDetector(
                      child: Card(
                        elevation: kSpacing8,
                        shadowColor: Colors.white54,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => Icon(
                              Icons.favorite,
                              size: 18,
                              color: _favorite.value ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      onTap: _onFavoriteTap,
                    ),
                    right: 0,
                    top: 0,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  kSpacing8, kSpacing8, kSpacing4, kSpacing4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _pet.name,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _pet.genre,
                      )
                    ],
                  ),
                  Icon(
                    _pet.sex == Gender.male ? Icons.male : Icons.female,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onFavoriteTap() {
    _pet.favorite = !_pet.favorite;
    _favorite.value = _pet.favorite;
    onFavoriteTap?.call(_pet);
  }
}
