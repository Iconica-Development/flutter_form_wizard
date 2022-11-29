// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/utils/translation_service.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../flutter_form.dart';

/// Input for a number used in a [FlutterForm].
///
/// [minValue] sets the minimal value of the picker.
/// [maxValue] sets the maximal value of the picker.
///
/// Standard controller is [FlutterFormInputNumberPickerController].
class FlutterFormInputNumberPicker extends FlutterFormInputWidget<int> {
  const FlutterFormInputNumberPicker({
    Key? key,
    required FlutterFormInputController<int> controller,
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

    return input.FlutterFormInputNumberPicker(
      minValue: minValue,
      maxValue: maxValue,
      onSaved: (value) => controller.onSaved(value),
      validator: (value) => controller.onValidate(value, _),
      onChanged: (value) => controller.onChanged?.call(value),
      initialValue: controller.value ?? minValue,
    );
  }
}

class FlutterFormInputNumberPickerController
    implements FlutterFormInputController<int> {
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
      int? value, String Function(String, {List<String>? params}) translator) {
    if (mandatory) {}

    return null;
  }
}
