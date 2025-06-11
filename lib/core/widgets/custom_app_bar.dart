import 'package:flutter/material.dart';

import '../utils/styles.dart';

AppBar customAppbar(
  BuildContext context, {
  required String title,
  List<Widget>? actions,
  bool? noBack,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon:
          noBack == null
              ? const Icon(Icons.arrow_back_ios_new_outlined, size: 18)
              : SizedBox(),
    ),
    title: Text(title, style: Styles.subTitle1Bold),
    actions: actions,
  );
}
