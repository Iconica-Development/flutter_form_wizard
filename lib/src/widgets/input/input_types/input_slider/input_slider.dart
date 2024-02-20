// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/flutter_form.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;

/// Input for a number value between two values via a slider. Used in a
/// [FlutterForm].
///
/// Standard controller is [FlutterFormInputSliderController].
class FlutterFormInputSlider extends FlutterFormInputWidget<double> {
  /// Creates a [FlutterFormInputPassword].
  ///
  /// The [controller] parameter is required.
  /// The [focusNode] parameter specifies the focus node of the input field.
  /// The [label] parameter specifies the label of the input field.
  /// The [enabled] parameter specifies whether the input field is enabled.
  const FlutterFormInputSlider({
    required super.controller,
    super.key,
    super.focusNode,
    super.label,
    this.minValue = 0,
    this.maxValue = 100,
  }) : assert(minValue < maxValue, 'minValue must be less than maxValue');

  final int minValue;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    var _ = getTranslator(context);

    super.registerController(context);

    return input.FlutterFormInputSlider(
      focusNode: focusNode,
      onSaved: controller.onSaved,
      validator: (value) => controller.onValidate(value, _),
    );
  }
}

/// Controller for slider used by a [FlutterFormInputWidget] used in a
/// [FlutterForm].
///
/// Mainly used by [FlutterFormInputSlider].
class FlutterFormInputSliderController
    implements FlutterFormInputController<double> {
  /// Creates a [FlutterFormInputPasswordController].
  ///
  /// The [id] parameter specifies the unique identifier for the controller.
  /// The [mandatory] parameter specifies whether the input is mandatory.
  /// The [value], [checkPageTitle], [checkPageDescription], [onChanged],
  /// and [onSubmit] parameters are optional.
  FlutterFormInputSliderController({
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
  double? value;

  @override
  bool mandatory;

  @override
  String Function(double? value)? checkPageTitle;

  @override
  String Function(double? value)? checkPageDescription;

  @override
  void Function(double? value)? onChanged;

  @override
  void Function(double? value)? onSubmit;

  @override
  void onSaved(double? value) {
    this.value = value;
  }

  @override
  String? onValidate(
    double? value,
    String Function(String, {List<String>? params}) translator,
  ) {
    if (mandatory) {}

    return null;
  }
}
