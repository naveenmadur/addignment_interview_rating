import 'package:flutter/material.dart';

class ColorConstants {
  static const Color kGrey = Color.fromRGBO(233, 235, 242, 1);
  static const Color kDarkBlue = Color.fromRGBO(24, 34, 76, 1);
  static const Color kGreyShadowColor = Color.fromRGBO(219, 222, 230, 1);
  static const Color kGreenShadowColor = Colors.green;
  static const Color kEnableButtonColor = Color.fromRGBO(28, 134, 62, 1);
  static const Color kDisableButtonColor = Color.fromRGBO(153, 158, 178, 1);
  static const Color kEnableTextColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color kDisableTextColor = Color.fromRGBO(108, 114, 139, 1);
  static const Color kAddedTextColor = Color.fromRGBO(42, 147, 240, 1);
  static const Color kSelectedContainerColor = Color.fromRGBO(9, 61, 201, 1);
  static const Color kEnableQualityContainerColor = Color.fromRGBO(212, 224, 224, 1);
  
  static const kSearchBarShadow = BoxShadow(
      color: ColorConstants.kGreyShadowColor,
      blurRadius: 10,
      spreadRadius: 3,
      offset: Offset(0, 5));
  static const kDisableButtonShadow = BoxShadow(
      color: ColorConstants.kGreyShadowColor,
      blurRadius: 10,
      spreadRadius: -2,
      offset: Offset(0, 5));
  static const kEnableButtonShadow = BoxShadow(
      color: ColorConstants.kGreenShadowColor,
      blurRadius: 10,
      spreadRadius: -2,
      offset: Offset(0, 5));
}

class Shadow {
  var kDisableButtonBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: ColorConstants.kDisableButtonColor,
    boxShadow: const [ColorConstants.kDisableButtonShadow],
  );

  var kEnableButtonBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: ColorConstants.kEnableButtonColor,
    boxShadow: const [ColorConstants.kEnableButtonShadow],
  );
}
