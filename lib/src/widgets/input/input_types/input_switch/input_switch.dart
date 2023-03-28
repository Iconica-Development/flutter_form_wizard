// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/flutter_form.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;

/// Input for a boolean switch. Used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputSwitchController].
class FlutterFormInputSwitch extends FlutterFormInputWidget<bool> {
  const FlutterFormInputSwitch({
    Key? key,
    required FlutterFormInputController<bool> controller,
    FocusNode? focusNode,
    Widget? label,
  }) : super(
            key: key,
            controller: controller,
            focusNode: focusNode,
            label: label);

  @override
  Widget build(BuildContext context) {
    String Function(String, {List<String>? params}) _ = getTranslator(context);

    super.registerController(context);

    return input.FlutterFormInputSwitch(
      focusNode: focusNode,
      onSaved: (value) => controller.onSaved(value),
      onChanged: controller.onChanged,
      validator: (value) => controller.onValidate(value, _),
      initialValue: controller.value ?? false,
    );
  }
}

/// Controller for the switch used by a [FlutterFormInputWidget] used in a [FlutterForm].
///
/// Mainly used by [FlutterFormInputSwitch].
class FlutterFormInputSwitchController
    implements FlutterFormInputController<bool> {
  FlutterFormInputSwitchController({
    required this.id,
    this.mandatory = true,
    this.value,
    this.checkPageTitle,
    this.checkPageDescription,
    this.onChanged,
  });

  @override
  String? id;

  @override
  bool? value;

  @override
  bool mandatory;

  @override
  String Function(bool? value)? checkPageTitle;

  @override
  String Function(bool? value)? checkPageDescription;

  @override
  void Function(bool? value)? onChanged;

  @override
  void Function(bool? value)? onSubmit;

  @override
  void onSaved(bool? value) {
    this.value = value;
  }

  @override
  String? onValidate(
      bool? value, String Function(String, {List<String>? params}) translator) {
    return null;
  }
}
