// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;
import 'package:flutter_form_wizard/utils/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../flutter_form.dart';

/// Input for a number value between two values via a slider. Used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputSliderController].
class FlutterFormInputSlider extends FlutterFormInputWidget<double> {
  const FlutterFormInputSlider({
    Key? key,
    required FlutterFormInputController<double> controller,
    Widget? label,
    this.minValue = 0,
    this.maxValue = 100,
  })  : assert(minValue < maxValue),
        super(key: key, controller: controller, label: label);

  final int minValue;
  final int maxValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);

    super.registerController(context);

    return input.FlutterFormInputSlider(
      onSaved: (value) => controller.onSaved(value),
      validator: (value) => controller.onValidate(value, _),
    );
  }
}

/// Controller for slider used by a [FlutterFormInputWidget] used in a [FlutterForm].
///
/// Mainly used by [FlutterFormInputSlider].
class FlutterFormInputSliderController
    implements FlutterFormInputController<double> {
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
  String? onValidate(double? value,
      String Function(String, {List<String>? params}) translator) {
    if (mandatory) {}

    return null;
  }
}
