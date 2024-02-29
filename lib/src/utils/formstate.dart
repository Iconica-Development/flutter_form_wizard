// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/src/utils/form_page_controller.dart';

/// Widget for managing form state and providing access to form controller.
class FormState extends InheritedWidget {
  /// Constructor for FormState.
  const FormState({
    required super.child,
    required this.formController,
    super.key,
  });

  /// The form controller associated with this FormState.
  final FlutterFormPageController formController;

  /// Retrieves the nearest ancestor FormState from the given context.
  static FormState of(BuildContext context) {
    var result = context.dependOnInheritedWidgetOfExactType<FormState>();
    assert(result != null, 'No FormStat found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FormState oldWidget) =>
      formController != oldWidget.formController;
}
