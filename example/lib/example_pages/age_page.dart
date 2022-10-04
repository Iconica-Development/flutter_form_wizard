import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:form_example/template_page.dart';

class AgePage extends StatefulWidget {
  const AgePage({
    required this.inputController,
    super.key,
  });

  final FlutterFormInputNumberPickerController inputController;

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.height / 40;

    return TemplatePage(
      size: size,
      fontSize: fontSize,
      title: "What is your age?",
      pageNumber: 1,
      amountOfPages: 3,
      flutterFormWidgets: [
        FlutterFormInputNumberPicker(
          minValue: 12,
          maxValue: 120,
          controller: widget.inputController,
        ),
      ],
    );
  }
}
