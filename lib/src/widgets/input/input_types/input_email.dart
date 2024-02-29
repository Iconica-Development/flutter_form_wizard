// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/flutter_form.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;

/// Input for an email used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputEmailController].
class FlutterFormInputEmail extends FlutterFormInputWidget<String> {
  /// Creates a [FlutterFormInputEmail].
  ///
  /// The [controller] parameter is required.
  /// The [key], [focusNode], [label], and [enabled] parameters are optional.
  const FlutterFormInputEmail({
    required super.controller,
    required this.validationMessage,
    super.key,
    super.focusNode,
    super.label,
    bool? enabled,
    this.validator,
    this.decoration,
  }) : super(
          enabled: enabled ?? true,
        );

  final InputDecoration? decoration;
  final String validationMessage;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    super.registerController(context);

    return input.FlutterFormInputPlainText(
      enabled: enabled,
      initialValue: controller.value,
      onSaved: (value) {
        controller.onSaved(value);
      },
      focusNode: focusNode,
      validator: validator ??
          (value) => controller.onValidate(value, validationMessage),
      onChanged: (value) => controller.onChanged?.call(value),
      decoration: decoration,
    );
  }
}

/// Controller for emails used by a [FlutterFormInputWidget] used in
/// a [FlutterForm].
///
/// Mainly used by [FlutterFormInputEmail].
class FlutterFormInputEmailController
    implements FlutterFormInputController<String> {
  /// Creates a [FlutterFormInputEmailController].
  ///
  /// The [id] parameter specifies the unique identifier for the controller.
  /// The [mandatory] parameter specifies whether the input is mandatory.
  /// The [value], [checkPageTitle], [checkPageDescription], [onChanged],
  /// and [onSubmit] parameters are optional.
  FlutterFormInputEmailController({
    required this.id,
    this.mandatory = true,
    this.value,
    this.checkPageTitle,
    this.checkPageDescription,
    this.onChanged,
    this.onSubmit,
  });

  @override
  String? id;

  @override
  String? value;

  @override
  bool mandatory;

  @override
  String Function(String? value)? checkPageTitle;

  @override
  String Function(String? value)? checkPageDescription;

  @override
  void Function(String? value)? onChanged;

  @override
  void Function(String? value)? onSubmit;

  @override
  void onSaved(value) {
    this.value = value;
  }

  @override
  String? onValidate(
    String? value,
    String validationMessage,
  ) {
    if (mandatory) {
      if (value == null || value.isEmpty) {
        return validationMessage;
      }

      if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(value)) {
        return validationMessage;
      }
    }

    return null;
  }
}
