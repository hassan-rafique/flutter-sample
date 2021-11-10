import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String url;
  static final _radius = 10.0;

  ProfileImage(this.url);

  @override
  Widget build(BuildContext context) => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(_radius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_radius),
          child: Image(
            image: NetworkImage(url),
          ),
        ),
      );
}
