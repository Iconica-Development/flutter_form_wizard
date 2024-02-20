// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/flutter_form.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;

/// Input for a password used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputEmailController].
class FlutterFormInputPassword extends FlutterFormInputWidget<String> {
  const FlutterFormInputPassword({
    required super.controller,
    super.key,
    super.focusNode,
    super.label,
    bool? enabled,
  }) : super(
          enabled: enabled ?? true,
        );

  @override
  Widget build(BuildContext context) {
    super.registerController(context);

    var _ = getTranslator(context);

    return input.FlutterFormInputPassword(
      enabled: enabled,
      initialValue: controller.value,
      focusNode: focusNode,
      onSaved: controller.onSaved,
      validator: (value) => controller.onValidate(value, _),
      onChanged: (value) => controller.onChanged?.call(value),
      onFieldSubmitted: (value) => controller.onSubmit?.call(value),
    );
  }
}

/// Controller for passwords used by a [FlutterFormInputWidget] used in a
/// [ShellFrom].
///
/// Mainly used by [FlutterFormInputPassword].
class FlutterFormInputPasswordController
    implements FlutterFormInputController<String> {
  /// Creates a [FlutterFormInputPasswordController].
  ///
  /// The [id] parameter specifies the unique identifier for the controller.
  /// The [mandatory] parameter specifies whether the input is mandatory.
  /// The [value], [checkPageTitle], [checkPageDescription], [onChanged],
  ///  and [onSubmit] parameters are optional.
  FlutterFormInputPasswordController({
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
    String Function(String, {List<String>? params}) translator,
  ) {
    if (mandatory) {
      if (value == null || value.isEmpty) {
        return translator('Field can not be empty');
      }

      if (value.length < 6) {
        return translator('Field should be at least 6 characters long');
      }
    }

    return null;
  }
}
