import 'package:flutter/material.dart';

import 'color_constants.dart';

class TextStyles {
  static const TextStyle kAppBarTextStyle = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: ColorConstants.kDarkBlue);

      static const TextStyle kTitleTextStyle = TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
      static const TextStyle kTrailingTextStyle = TextStyle(fontSize: 18, decoration: TextDecoration.underline);
}