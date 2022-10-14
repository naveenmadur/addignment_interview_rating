import 'package:flutter/material.dart';

import 'text_styles.dart';

class TextConstants {
  static const kAdd = Text('ADD', style: TextStyles.kTrailingTextStyle);

  static const kAdded = Text('REMOVE', style: TextStyles.kTrailingTextStyle);

  static const kClappingHands =
      Text('👏🏻', style: TextStyles.kRatingTileIconTextStyle);

  static const kThumbsUp =
      Text('👍🏻', style: TextStyles.kRatingTileIconTextStyle);

  static const kNeutralFace =
      Text('😐', style: TextStyles.kRatingTileIconTextStyle);

  static const kFrowningFace =
      Text('😕', style: TextStyles.kRatingTileIconTextStyle);

  static const kRatingsScrenText =  
      Text('How would you rate your interviewer(s)?',
      style: TextStyle(fontSize: 48, fontWeight: FontWeight.w500),);

  static const kSelectYourRatingText =  
      Text('Select your ratings', 
      style: TextStyles.kAddedListLengthTextStyle,);

  static const kFloatingActionButtonNextText = Text('NEXT',style: TextStyles.kEnableButtonTextStyle,);

  //! Enable Titles
  static const kRatingTileEnableAwesomeTitle = Text('Awesome', style: TextStyles.kRatingTileActiveTextStyle);
  static const kRatingTileEnableNeutralTitle = Text('Neutral', style: TextStyles.kRatingTileActiveTextStyle);
  static const kRatingTileEnableGoodTitle = Text('Good', style: TextStyles.kRatingTileActiveTextStyle);
  static const kRatingTileEnableBadTitle = Text('Bad', style: TextStyles.kRatingTileActiveTextStyle);
  
  //! Enable Subtitles
  static const kRatingTileEnableAwesomeSubtitle = Text('Best Interview. \n Ever!', style: TextStyles.kRatingTileActiveTextStyle,);
  static const kRatingTileEnableNeutralSubtitle = Text('Nice Person. Really \n Nice!', style: TextStyles.kRatingTileActiveTextStyle,);
  static const kRatingTileEnableGoodSubtitle = Text('Ummmm... Okay \n I guess!', style: TextStyles.kRatingTileActiveTextStyle,);
  static const kRatingTileEnableBadSubtitle = Text('Needs to Improve! \n A LOT!', style: TextStyles.kRatingTileActiveTextStyle,);

  //! Disable Titles
  static const kRatingTileDisableAwesomeTitle = Text('Awesome', style: TextStyle(fontSize: 20,));
  static const kRatingTileDisableNeutralTitle = Text('Neutral', style: TextStyle(fontSize: 20,));
  static const kRatingTileDisableGoodTitle = Text('Good', style: TextStyle(fontSize: 20));
  static const kRatingTileDisableBadTitle = Text('Bad', style: TextStyle(fontSize: 20));

  //! Disable Subtitles
  static const kRatingTileDisableAwesomeSubtitle = Text('Best Interview. \n Ever!', style: TextStyle(fontSize: 20,),);
  static const kRatingTileDisableNeutralSubtitle = Text('Nice Person. Really \n Nice!', style: TextStyle(fontSize: 20,),);
  static const kRatingTileDisableGoodSubtitle = Text('Ummmm... Okay \n I guess!', style: TextStyle(fontSize: 20,),);
  static const kRatingTileDisableBadSubtitle = Text('Needs to Improve! \n A LOT!', style: TextStyle(fontSize: 20,),);

  //! Subtitles of Quality Screen
  static const kQualityScreenAwesomeSubtitle = Text('Best Interview. \n Ever!', style: TextStyles.kQualityScreenSubtitleTextStyle,);
  static const kQualityScreenNeutralSubtitle = Text('Nice Person. Really \n Nice!', style: TextStyles.kQualityScreenSubtitleTextStyle,);
  static const kQualityScreenGoodSubtitle = Text('Ummmm... Okay \n I guess!', style: TextStyles.kQualityScreenSubtitleTextStyle,);
  static const kQualityScreenBadSubtitle = Text('Needs to Improve! \n A LOT!', style: TextStyles.kQualityScreenSubtitleTextStyle,);

}
