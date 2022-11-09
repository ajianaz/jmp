import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

class ElevatedButtonCustom extends StatelessWidget {
  const ElevatedButtonCustom({
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
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        primary: borderColor,
      ),
      child: Text(text.toUpperCase()),
    );
  }
}
