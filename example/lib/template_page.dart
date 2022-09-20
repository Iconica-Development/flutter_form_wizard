import 'package:flutter/material.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({
    super.key,
    required this.size,
    required this.fontSize,
    required this.title,
    required this.pageNumber,
    required this.amountOfPages,
    required this.shellFormWidgets,
  });

  final Size size;
  final double fontSize;
  final String title;
  final int pageNumber;
  final int amountOfPages;
  final List<Widget> shellFormWidgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height / 10,
                ),
                Text(
                  "$pageNumber / $amountOfPages",
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
                SizedBox(
                  height: size.height / 80,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        for (var widget in shellFormWidgets) ...[
          widget,
        ],
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
