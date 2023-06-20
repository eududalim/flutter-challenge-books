import 'package:flutter/material.dart';
import 'package:flutter_challenge_books/app/shared/theme/colors_theme_const.dart';

class TitleSectionWidget extends StatelessWidget {
  const TitleSectionWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textLarge.copyWith(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        TextButton(
            onPressed: () {},
            child: const Text('ver todos',
                style:
                    TextStyle(color: themeColor, fontWeight: FontWeight.bold))),
      ],
    );
  }
}
