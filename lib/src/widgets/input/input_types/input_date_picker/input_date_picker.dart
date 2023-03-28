// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;
import 'package:intl/intl.dart';

import '../../../../../flutter_form.dart';

/// Input for a dateTime used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputDateController].
class FlutterFormInputDateTime extends FlutterFormInputWidget<String> {
  const FlutterFormInputDateTime({
    Key? key,
    required FlutterFormInputController<String> controller,
    Widget? label,
    this.showIcon = true,
    required this.inputType,
    required this.dateFormat,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.initialDateTimeRange,
    this.icon = Icons.calendar_today,
  }) : super(
          key: key,
          controller: controller,
          label: label,
        );
  final bool showIcon;
  final input.FlutterFormDateTimeType inputType;
  final DateFormat dateFormat;
  final DateTime? initialDate;
  final DateTimeRange? initialDateTimeRange;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context);
    super.registerController(context);

    return input.FlutterFormInputDateTime(
      label: label,
      icon: icon,
      firstDate: firstDate,
      lastDate: lastDate,
      inputType: inputType,
      onChanged: (value) => controller.onChanged?.call(value),
      onSaved: (value) => controller.onSaved(value),
      validator: (value) => controller.onValidate(value, _),
      initialValue: controller.value,
      dateFormat: dateFormat,
      initialDate: initialDate,
      initialDateTimeRange: initialDateTimeRange,
    );
  }
}

/// Controller for dates used by a [FlutterFormInputWidget] used in a [FlutterForm].
///
/// Mainly used by [FlutterFormInputDateTime].
class FlutterFormInputDateTimeController
    implements FlutterFormInputController<String> {
  FlutterFormInputDateTimeController({
    required this.id,
    this.mandatory = true,
    this.value,
    this.checkPageTitle,
    this.checkPageDescription,
    this.initialDate,
    this.initialDateTimeRange,
    required this.dateTimeType,
    required this.dateFormat,
    this.onChanged,
  });

  final DateTime? initialDate;
  final DateTimeRange? initialDateTimeRange;
  final DateFormat dateFormat;
  final input.FlutterFormDateTimeType dateTimeType;

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
  void onSaved(dynamic value) {
    this.value = value;
  }

  @override
  String? onValidate(String? value,
      String Function(String, {List<String>? params}) translator) {
    if (mandatory) {
      if (value == null || value.isEmpty) {
        return translator('shell.form.error.empty');
      }
    }

    return null;
  }
}
