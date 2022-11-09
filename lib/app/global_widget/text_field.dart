import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/values/colors.dart';
import '../core/values/dimens.dart';
import '../core/values/style.dart';

Widget buildTextField(
  String text,
  String hintText,
  RxString resultValue,
  TextInputType inputType, {
  String initValue = "",
  IconData icon = Icons.people,
  String font = 'OpenSans',
  Color bgcolor = const Color(0xFF6CA8F1),
  Color textColor = whiteColor,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        text,
        style: kLabelStyle,
      ),
      SizedBox(height: defaultPadding / 2),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 60.0,
        child: TextFormField(
          initialValue: initValue,
          keyboardType: inputType,
          style: TextStyle(
            color: textColor,
            fontFamily: font,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              icon,
              color: textColor,
            ),
            hintText: hintText,
            hintStyle: kHintTextStyle,
          ),
          onChanged: (value) {
            resultValue.value = value;
          },
        ),
      ),
    ],
  );
}
