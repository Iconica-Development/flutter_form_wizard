import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:form_example/template_page.dart';

class NamePage extends StatefulWidget {
  const NamePage({
    required this.firstNameController,
    required this.lastNameController,
    required this.showLastName,
    super.key,
  });

  final FlutterFormInputPlainTextController firstNameController;
  final FlutterFormInputPlainTextController lastNameController;
  final bool showLastName;

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.height / 40;

    return TemplatePage(
      size: size,
      fontSize: fontSize,
      pageNumber: 2,
      amountOfPages: 3,
      title: "Please enter your name",
      FlutterFormWidgets: [
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
          child: FlutterFormInputPlainText(
            label: const Text("First Name"),
            controller: widget.firstNameController,
          ),
        ),
        if (widget.showLastName)
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: FlutterFormInputPlainText(
              label: const Text("Last Name"),
              controller: widget.lastNameController,
            ),
          ),
      ],
    );
  }
}
