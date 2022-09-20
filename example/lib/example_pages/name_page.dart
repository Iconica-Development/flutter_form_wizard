import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/next_shell/form.dart';
import 'package:form_example/template_page.dart';

class NamePage {
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
        pageNumber: pageNumber,
        amountOfPages: amountOfPages,
        title: "Please enter your name",
        shellFormWidgets: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
            child: ShellFormInputPlainText(
              label: const Text("First Name"),
              controller: ShellFormInputPlainTextController(
                mandatory: true,
                id: "firstName",
                checkPageTitle: (dynamic firstName) {
                  return "First Name: $firstName";
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: ShellFormInputPlainText(
              label: const Text("Last Name"),
              controller: ShellFormInputPlainTextController(
                mandatory: true,
                id: "lastName",
                checkPageTitle: (dynamic lastName) {
                  return "Last Name: $lastName";
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
