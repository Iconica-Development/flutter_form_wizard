// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/flutter_form.dart';
import 'package:form_example/template_page.dart';
import 'package:intl/intl.dart';

class DatePage extends StatefulWidget {
  const DatePage({
    required this.dateController,
    super.key,
  });

  final FlutterFormInputDateTimeController dateController;

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
          child: FlutterFormInputDateTime(
            inputType: FlutterFormDateTimeType.dateTime,
            dateFormat: DateFormat('dd-MM-yyyy'),
            firstDate: DateTime.now(),
            initialDateTimeRange: DateTimeRange(
              start: DateTime.now(),
              end: DateTime.now().add(
                const Duration(days: 7),
              ),
            ),
            label: const Text("Custom date label"),
            controller: widget.dateController,
            validationMessage: 'Please fill in a date.',
          ),
        ),
      ],
    );
  }
}
