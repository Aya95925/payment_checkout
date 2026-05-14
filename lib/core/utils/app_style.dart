import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/app_color.dart';

abstract final class AppStyle {
  static const TextStyle medium25Black = TextStyle(
    color: AppColor.black,
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle semiBold24Green = TextStyle(
    color: AppColor.green,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle medium22Black = TextStyle(
    color: AppColor.black,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle regular18black = TextStyle(
    color: AppColor.black,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular16black = TextStyle(
    color: AppColor.black.withAlpha(200),
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle regular20black = TextStyle(
    color: AppColor.black,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle semiBild24black = TextStyle(
    color: AppColor.black,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
}
