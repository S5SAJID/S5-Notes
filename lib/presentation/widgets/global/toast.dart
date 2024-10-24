import 'package:flutter/material.dart';

SnackBar toast(BuildContext context, Widget child) {
  return SnackBar(
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 200,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).iconTheme.color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      ],
    ),
  );
}
