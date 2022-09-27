import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:form_example/template_page.dart';

class NamePage extends StatefulWidget {
  const NamePage({
    required this.firstNameController,
    required this.lastNameController,
    super.key,
  });

  final ShellFormInputPlainTextController firstNameController;
  final ShellFormInputPlainTextController lastNameController;

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
      pageNumber: 3,
      amountOfPages: 3,
      title: "Please enter your name",
      shellFormWidgets: [
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
          child: ShellFormInputPlainText(
            label: const Text("First Name"),
            controller: widget.firstNameController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: ShellFormInputPlainText(
            label: const Text("Last Name"),
            controller: widget.lastNameController,
          ),
        ),
      ],
    );
  }
}
