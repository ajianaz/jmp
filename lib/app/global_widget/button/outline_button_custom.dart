import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

class OutlineButtonCustom extends StatelessWidget {
  const OutlineButtonCustom({
    Key? key,
    required this.text,
    required this.callback,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final String text;
  final VoidCallback callback;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: callback,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side: BorderSide(color: borderColor),
      ),
      child: Text(text.toUpperCase()),
    );
  }
}
