import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:form_example/template_page.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({
    required this.inputController,
    required this.cars,
    super.key,
  });

  final FlutterFormInputCarouselController inputController;
  final List<Map<String, dynamic>> cars;

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.height / 40;

    return TemplatePage(
      size: size,
      fontSize: fontSize,
      title: "What's your favorite car?",
      pageNumber: 3,
      amountOfPages: 3,
      FlutterFormWidgets: [
        FlutterFormInputCarousel(
            controller: widget.inputController, items: getCars())
      ],
    );
  }

  List<Widget> getCars() {
    return widget.cars.map((car) {
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
}
