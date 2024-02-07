// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/src/utils/form_page_controller.dart';

class FormState extends InheritedWidget {
  const FormState({
    required super.child,
    required this.formController,
    super.key,
  });

  final FlutterFormPageController formController;

  static FormState of(BuildContext context) {
    var result = context.dependOnInheritedWidgetOfExactType<FormState>();
    assert(result != null, 'No FormStat found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FormState oldWidget) =>
      formController != oldWidget.formController;
}
