import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/base/base_page.dart';
import 'package:flutter_sample_app/presentation/core/values/colors.dart';
import 'package:flutter_sample_app/presentation/core/values/dimens.dart';
import 'package:flutter_sample_app/presentation/core/values/strings.dart';
import 'package:flutter_sample_app/presentation/page/pet/pet_detail_controller.dart';
import 'package:flutter_sample_app/presentation/util/constants.dart';
import 'package:flutter_sample_app/presentation/widget/line_shape.dart';
import 'package:flutter_sample_app/presentation/widget/profile_image.dart';
import 'package:get/get.dart';

class PetDetailPage extends BasePage<PetDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(controller.pet.value.image),
                ),
                Positioned(
                  left: kHorizontalMargin,
                  top: kSpacing8,
                  child: GestureDetector(
                    child: Icon(Icons.arrow_back),
                    onTap: _onBackPress,
                  ),
                ),
              ],
            ),
            Expanded(
              child: _TopRoundedCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: kSpacing16),
                    const LineShape(
                      width: 100,
                      height: 6,
                    ),
                    const SizedBox(height: kSpacing16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: kSpacing30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.pet.value.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                  controller.pet.value.sex == Gender.male
                                      ? Icons.male
                                      : Icons.female,
                                  size: 36,
                                  color: kPrimaryColor),
                            ],
                          ),
                          const SizedBox(height: kSpacing4),
                          Text(
                            controller.pet.value.genre,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: kSpacing20),
                    Expanded(
                      child: _TopRoundedCard(
                        backgroundColor: kBackgroundColor,
                        margin: EdgeInsets.symmetric(horizontal: kSpacing10),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: kSpacing30,
                                  left: kSpacing30,
                                  right: kSpacing30,
                                  bottom: kSpacing10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: _FieldCard(
                                            'Age',
                                            '${controller.pet.value.age} Year',
                                          ),
                                        ),
                                        const SizedBox(width: kSpacing16),
                                        Expanded(
                                          child: _FieldCard(
                                            'sex',
                                            controller.pet.value.sex ==
                                                    Gender.male
                                                ? 'Male'
                                                : 'Female',
                                          ),
                                        ),
                                        const SizedBox(width: kSpacing16),
                                        Expanded(
                                          child: _FieldCard(
                                            'Weight',
                                            '${controller.pet.value.weight} kg',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: kSpacing20),
                                    Text(
                                      kLabelPetStory,
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: kSpacing10),
                                    Expanded(
                                      child: Text(
                                        kRandomStory,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                color: Colors.black,
                                                letterSpacing: 2,
                                                height: 1.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            OwnerView(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onBackPress() {
    Get.back();
  }
}

class OwnerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _TopRoundedCard(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kSpacing30, vertical: kSpacing20),
          child: Row(
            children: [
              ProfileImage(kSampleImage),
              SizedBox(width: kSpacing16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nannie Barker',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Text('Owner'),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text(kLabelContactMe)),
            ],
          ),
        ),
      );
}

class _TopRoundedCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget? child;
  final EdgeInsetsGeometry? margin;

  _TopRoundedCard(
      {Key? key, this.backgroundColor = Colors.white, this.child, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(kSpacing30),
            topRight: const Radius.circular(kSpacing30),
          ),
        ),
        child: child,
      );
}

class _FieldCard extends StatelessWidget {
  final String _label;
  final String _value;

  _FieldCard(this._label, this._value);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(kSpacing8)),
        ),
        child: Padding(
          padding: EdgeInsets.all(kSpacing10),
          child: Column(
            children: [
              const SizedBox(height: 2),
              Text(_label.toUpperCase()),
              const SizedBox(height: 2),
              Text(
                _value,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
            ],
          ),
        ),
      );
}
