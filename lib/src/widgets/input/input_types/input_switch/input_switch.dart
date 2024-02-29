// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/flutter_form.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;

/// Input for a boolean switch. Used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputSwitchController].
class FlutterFormInputSwitch extends FlutterFormInputWidget<bool> {
  const FlutterFormInputSwitch({
    required super.controller,
    super.key,
    super.focusNode,
    super.label,
  });

  @override
  Widget build(BuildContext context) {
    var translator = getTranslator(context);

    super.registerController(context);

    return input.FlutterFormInputBool(
      focusNode: focusNode,
      onSaved: controller.onSaved,
      onChanged: controller.onChanged,
      validator: (value) => controller.onValidate(value, translator),
      initialValue: controller.value ?? false,
      widgetType: input.BoolWidgetType.switchWidget,
    );
  }
}

/// Controller for the switch used by a [FlutterFormInputWidget] used in a
/// [FlutterForm].
///
/// Mainly used by [FlutterFormInputSwitch].
class FlutterFormInputSwitchController
    implements FlutterFormInputController<bool> {
  /// Creates a [FlutterFormInputSwitchController].
  ///
  /// The [id] parameter specifies the unique identifier for the controller.
  /// The [mandatory] parameter specifies whether the input is mandatory.
  /// The [value], [checkPageTitle], [checkPageDescription],
  /// and [onChanged] parameters are optional.
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
    bool? value,
    String Function(String, {List<String>? params}) translator,
  ) =>
      null;
}
