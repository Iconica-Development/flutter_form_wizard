import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/next_shell/form.dart';
import 'package:form_example/template_page.dart';

class CarouselPage {
  final List<Map<String, dynamic>> cars = [
    {
      "title": "Mercedes",
      "description": "Mercedes is a car",
    },
    {
      "title": "BMW",
      "description": "BMW is a car",
    },
    {
      "title": "Mazda",
      'description': "Mazda is a car",
    },
  ];

  List<Widget> getCars() {
    return cars.map((car) {
      return Builder(
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD8D8D8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Image.asset('assets/images/${car['title']}.png'),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                car["title"],
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                car["description"],
                style: const TextStyle(fontSize: 16),
              ),
            ],
          );
        },
      );
    }).toList();
  }

  ShellFormPage returnPage(
    Size size,
    double fontSize,
    int pageNumber,
    int amountOfPages,
  ) {
    return ShellFormPage(
      child: TemplatePage(
        size: size,
        fontSize: fontSize,
        title: "What's your favorite car?",
        pageNumber: pageNumber,
        amountOfPages: amountOfPages,
        shellFormWidgets: [
          ShellFormInputCarousel(
              controller: ShellFormInputCarouselController(
                id: 'carCarousel',
                checkPageTitle: (dynamic index) {
                  return cars[index]["title"];
                },
                checkPageDescription: (dynamic index) {
                  return cars[index]["description"];
                },
              ),
              items: getCars())
        ],
      ),
    );
  }
}
