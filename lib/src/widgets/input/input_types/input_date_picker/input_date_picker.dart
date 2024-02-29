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
  /// Creates a [FlutterFormInputDateTime].
  ///
  /// The [controller], [inputType], [dateFormat] are required parameters.
  /// The [label] parameter specifies the label of the input field.
  /// The [showIcon] parameter determines whether to show an icon
  /// with the input field.
  /// The [firstDate] and [lastDate] parameters specify the range
  /// of selectable dates.
  /// The [initialDate] parameter specifies the initial date for
  /// the input field.
  /// The [initialDateTimeRange] parameter specifies the initial
  /// date time range for the input field.
  /// The [icon] parameter specifies the icon to show with the input field.
  /// The [enabled] parameter specifies whether the input field is enabled.
  /// The [onTapEnabled] parameter specifies whether tapping on
  /// the input field is enabled.
  const FlutterFormInputDateTime({
    required super.controller,
    required this.inputType,
    required this.dateFormat,
    required this.validationMessage,
    super.key,
    super.label,
    this.showIcon = true,
    this.validator,
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
  final String validationMessage;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
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
      validator: validator ??
          (value) => controller.onValidate(value, validationMessage),
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
  /// Creates a [FlutterFormInputDateTimeController].
  ///
  /// The [id], [dateTimeType], and [dateFormat] are required parameters.
  /// The [mandatory] parameter specifies whether the input is mandatory.
  /// The [value], [initialDate], [initialDateTimeRange], [checkPageTitle],
  /// [checkPageDescription], and [onChanged] parameters are optional.
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
    String validationMessage,
  ) {
    if (mandatory) {
      if (value == null || value.isEmpty) {
        return validationMessage;
      }
    }

    return null;
  }
}
