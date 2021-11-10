import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/base/base_controller.dart';
import 'package:get/get.dart';

abstract class BasePage<T extends BaseController> extends GetView<T> {}
