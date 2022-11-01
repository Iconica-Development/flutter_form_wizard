// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'form_page_controller.dart';

class FormState extends InheritedWidget {
  const FormState({
    Key? key,
    required Widget child,
    required this.formController,
  }) : super(key: key, child: child);

  final FlutterFormPageController formController;

  static FormState of(BuildContext context) {
    final FormState? result =
        context.dependOnInheritedWidgetOfExactType<FormState>();
    assert(result != null, 'No FormStat found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FormState oldWidget) =>
      formController != oldWidget.formController;
}
