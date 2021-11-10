import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/core/values/colors.dart';
import 'package:flutter_sample_app/presentation/core/values/dimens.dart';

class LineShape extends StatelessWidget {
  final double? width;
  final double? height;

  const LineShape({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(kSpacing4),
        ),
      ),
    );
  }
}
