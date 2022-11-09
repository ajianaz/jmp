import 'package:flutter/material.dart';

import '../core/values/colors.dart';
import '../core/values/dimens.dart';

class TextView extends StatelessWidget {
  //Required variabel
  final String text;

  //
  TextStyle style = textStyleBody1;
  TextAlign alignment = TextAlign.left;
  TextOverflow overflow = TextOverflow.visible;

  TextView(
      {super.key,
      required this.text,
      this.style = textStyleBody1,
      this.alignment = TextAlign.left,
      this.overflow = TextOverflow.visible});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: alignment,
      overflow: overflow,
    );
  }
}

const TextStyle textStyleHead1 = TextStyle(
  fontSize: sizeHead1,
  letterSpacing: spacingHead1,
  // fontFamily: fontRubik,
  fontWeight: fontWeightLight,
  color: basicBlack,
);

const TextStyle textStyleHead2 = TextStyle(
  fontSize: sizeHead2,
  letterSpacing: spacingHead2,
  // fontFamily: fontRubik,
  fontWeight: fontWeightLight,
  color: basicBlack,
);

const TextStyle textStyleHead3 = TextStyle(
  fontSize: sizeHead3,
  letterSpacing: spacingHead3,
  // fontFamily: fontRubik,
  fontWeight: fontWeightRegular,
  color: basicBlack,
);

const TextStyle textStyleHead4 = TextStyle(
  fontSize: sizeHead4,
  letterSpacing: spacingHead4,
  // fontFamily: fontRubik,
  fontWeight: fontWeightRegular,
  color: basicBlack,
);

const TextStyle textStyleHead5 = TextStyle(
  fontSize: sizeHead5,
  letterSpacing: spacingHead5,
  // fontFamily: fontRubik,
  fontWeight: fontWeightRegular,
  color: basicBlack,
);

const TextStyle textStyleHead6 = TextStyle(
  fontSize: sizeHead6,
  letterSpacing: spacingHead6,
  // fontFamily: fontRubik,
  fontWeight: fontWeightMedium,
  color: basicBlack,
);

const TextStyle textStyleSubhead1 = TextStyle(
  fontSize: sizeSubhead1,
  letterSpacing: spacingSubhead1,
  // fontFamily: fontRubik,
  fontWeight: fontWeightRegular,
  color: basicBlack,
);

const TextStyle textStyleSubhead2 = TextStyle(
  fontSize: sizeSubhead2,
  letterSpacing: spacingSubhead2,
  // fontFamily: fontRubik,
  fontWeight: fontWeightMedium,
  color: basicBlack,
);

const TextStyle textStyleBody1 = TextStyle(
  fontSize: sizeBody1,
  letterSpacing: spacingBody1,
  // fontFamily: fontKarla,
  fontWeight: fontWeightRegular,
  color: basicBlack,
);

const TextStyle textStyleBody2 = TextStyle(
  fontSize: sizeBody2,
  letterSpacing: spacingBody2,
  // fontFamily: fontKarla,
  fontWeight: fontWeightRegular,
  color: basicBlack,
);

const TextStyle textStyleButton = TextStyle(
  fontSize: sizeButton,
  letterSpacing: spacingButton,
  // fontFamily: fontKarla,
  fontWeight: fontWeightMedium,
  color: basicBlack,
);

const TextStyle textStyleNote = TextStyle(
  fontSize: sizeNote,
  letterSpacing: spacingNote,
  // fontFamily: fontKarla,
  fontWeight: fontWeightRegular,
  color: basicBlack,
);
