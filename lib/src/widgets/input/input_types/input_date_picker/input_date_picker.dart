// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/flutter_form.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;
import 'package:intl/intl.dart';

/// Input for a dateTime used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputDateController].
class FlutterFormInputDateTime extends FlutterFormInputWidget<String> {
  const FlutterFormInputDateTime({
    required super.controller,
    required this.inputType,
    required this.dateFormat,
    super.key,
    super.label,
    this.showIcon = true,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.initialDateTimeRange,
    this.icon = Icons.calendar_today,
    this.enabled = true,
    this.onTapEnabled = true,
  });
  final bool showIcon;
  final input.FlutterFormDateTimeType inputType;
  final DateFormat dateFormat;
  final DateTime? initialDate;
  final DateTimeRange? initialDateTimeRange;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final IconData icon;
  final bool enabled;
  final bool onTapEnabled;

  @override
  Widget build(BuildContext context) {
    var _ = getTranslator(context);
    super.registerController(context);

    return input.FlutterFormInputDateTime(
      enabled: enabled,
      showIcon: showIcon,
      onTapEnabled: onTapEnabled,
      label: label,
      icon: icon,
      firstDate: firstDate,
      lastDate: lastDate,
      inputType: inputType,
      onChanged: (value) => controller.onChanged?.call(value),
      onSaved: controller.onSaved,
      validator: (value) => controller.onValidate(value, _),
      initialValue: controller.value,
      dateFormat: dateFormat,
      initialDate: initialDate,
      initialDateTimeRange: initialDateTimeRange,
    );
  }
}

/// Controller for dates used by a [FlutterFormInputWidget] used in a 
/// [FlutterForm].
///
/// Mainly used by [FlutterFormInputDateTime].
class FlutterFormInputDateTimeController
    implements FlutterFormInputController<String> {
  FlutterFormInputDateTimeController({
    required this.id,
    required this.dateTimeType,
    required this.dateFormat,
    this.mandatory = true,
    this.value,
    this.checkPageTitle,
    this.checkPageDescription,
    this.initialDate,
    this.initialDateTimeRange,
    this.onChanged,
  }) {
    if (value != null) {
      value = dateFormat.format(DateTime.parse(value!));
    }
  }

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
    }

    return null;
  }
}
