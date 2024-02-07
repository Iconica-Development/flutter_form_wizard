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
  const FlutterFormInputEmail({
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
    var _ = getTranslator(context);

    super.registerController(context);

    return input.FlutterFormInputPlainText(
      enabled: enabled,
      initialValue: controller.value,
      onSaved: (value) {
        controller.onSaved(value);
      },
      focusNode: focusNode,
      validator: (value) => controller.onValidate(value, _),
      onChanged: (value) => controller.onChanged?.call(value),
      decoration: InputDecoration(
        focusColor: Theme.of(context).primaryColor,
        label: label ?? const Text('Email'),
      ),
    );
  }
}

/// Controller for emails used by a [FlutterFormInputWidget] used in
/// a [FlutterForm].
///
/// Mainly used by [FlutterFormInputEmail].
class FlutterFormInputEmailController
    implements FlutterFormInputController<String> {
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
    String Function(String, {List<String>? params}) translator,
  ) {
    if (mandatory) {
      if (value == null || value.isEmpty) {
        return translator('shell.form.error.empty');
      }

      if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(value)) {
        return translator('shell.form.error.email.notValid');
      }
    }

    return null;
  }
}
