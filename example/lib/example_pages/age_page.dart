import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/next_shell/form.dart';
import 'package:form_example/template_page.dart';

class AgePage {
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
        title: "What is your age?",
        pageNumber: pageNumber,
        amountOfPages: amountOfPages,
        shellFormWidgets: [
          ShellFormInputNumberPicker(
            minValue: 12,
            maxValue: 120,
            controller: ShellFormInputNumberPickerController(
              id: "age",
              checkPageTitle: (dynamic amount) {
                return "Age: $amount years";
              },
            ),
          ),
        ],
      ),
    );
  }
}
