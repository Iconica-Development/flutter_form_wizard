import 'package:flutter/material.dart';
import 'package:flutter_form/next_shell/form.dart';

class CheckPageExample {
  CheckPage showCheckpage(
    BuildContext context,
    Size size,
    double fontSize,
    String checkPageText,
  ) {
    return CheckPage(
      title: Container(
        margin: const EdgeInsets.only(
          top: 60,
          bottom: 10,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          checkPageText,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      inputCheckWidget:
          (String title, String? description, Function onPressed) {
        return GestureDetector(
          onTap: () async {
            await onPressed();
          },
          child: Container(
            width: size.width * 0.9,
            padding: const EdgeInsets.only(
              top: 18,
              bottom: 16,
              right: 18,
              left: 27,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(0.20),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD8D8D8),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
                if (description != null)
                  const SizedBox(
                    height: 9,
                  ),
                if (description != null)
                  Text(
                    description,
                    style: TextStyle(fontSize: fontSize / 1.3),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
