import 'package:flutter/material.dart';

import 'color_constants.dart';

class TextStyles {
  static const TextStyle kAppBarTextStyle = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: ColorConstants.kDarkBlue);
      static const TextStyle kTitleTextStyle = TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
      static const TextStyle kTrailingTextStyle = TextStyle(fontSize: 16, decoration: TextDecoration.underline);
      static const TextStyle kDisableButtonTextStyle = TextStyle(fontSize: 17, color: ColorConstants.kDisableTextColor);
      static const TextStyle kEnableButtonTextStyle = TextStyle(fontSize: 17, color:ColorConstants.kEnableTextColor);
      static const TextStyle kRatingTileIconTextStyle = TextStyle(fontSize: 50);
      static const TextStyle kRatingTileActiveTextStyle = TextStyle(fontSize: 20, color: Colors.white);
      static const TextStyle kQualityScreenTrailingTextStyle = TextStyle(fontSize: 16, decoration: TextDecoration.underline, color: Colors.white);
      static const TextStyle kQualityScreenSubtitleTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white);
      static const TextStyle kAddedListLengthTextStyle = TextStyle(color: ColorConstants.kDisableTextColor, fontSize: 16, fontWeight: FontWeight.w600);
}