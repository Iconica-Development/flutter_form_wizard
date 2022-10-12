import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:form_example/template_page.dart';
import 'package:intl/intl.dart';

class DatePage extends StatefulWidget {
  const DatePage({
    required this.dateController,
    super.key,
  });

  final FlutterFormInputPlainTextController dateController;

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.height / 40;

    return TemplatePage(
      size: size,
      fontSize: fontSize,
      pageNumber: 4,
      amountOfPages: 4,
      title: "Please enter a date",
      flutterFormWidgets: [
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
          child: FlutterFormInputDate(
            dateFormat: DateFormat.yMd(),
            label: const Text("Date"),
            controller: widget.dateController,
          ),
        ),
      ],
    );
  }
}