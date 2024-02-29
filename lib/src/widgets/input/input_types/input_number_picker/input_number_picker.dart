// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/flutter_form.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;

/// Input for a number used in a [FlutterForm].
///
/// [minValue] sets the minimal value of the picker.
/// [maxValue] sets the maximal value of the picker.
///
/// Standard controller is [FlutterFormInputNumberPickerController].
class FlutterFormInputNumberPicker extends FlutterFormInputWidget<int> {
  const FlutterFormInputNumberPicker({
    required super.controller,
    super.key,
    super.label,
    this.minValue = 0,
    this.maxValue = 100,
  }) : assert(minValue < maxValue, 'minValue must be less than maxValue');

  final int minValue;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    var translator = getTranslator(context);

    super.registerController(context);

    return input.FlutterFormInputNumberPicker(
      minValue: minValue,
      maxValue: maxValue,
      onSaved: controller.onSaved,
      validator: (value) => controller.onValidate(value, translator),
      onChanged: (value) => controller.onChanged?.call(value),
      initialValue: controller.value ?? minValue,
    );
  }
}

/// Controller for numbers used by a [FlutterFormInputWidget] used in a
/// [FlutterForm].
///
/// Mainly used by [FlutterFormInputNumberPicker].
class FlutterFormInputNumberPickerController
    implements FlutterFormInputController<int> {
  /// Creates a [FlutterFormInputNumberPickerController].
  ///
  /// The [id] parameter specifies the unique identifier for the controller.
  /// The [mandatory] parameter specifies whether the input is mandatory.
  /// The [value], [checkPageTitle], [checkPageDescription],
  /// and [onChanged] parameters are optional.
  FlutterFormInputNumberPickerController({
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
  int? value;

  @override
  bool mandatory;

  @override
  String Function(int? value)? checkPageTitle;

  @override
  String Function(int? value)? checkPageDescription;

  @override
  void Function(int? value)? onChanged;

  @override
  void Function(int? value)? onSubmit;

  @override
  void onSaved(int? value) {
    this.value = value;
  }

  @override
  String? onValidate(
    int? value,
    String Function(String, {List<String>? params}) translator,
  ) {
    if (mandatory) {}

    return null;
  }
}
