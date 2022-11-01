// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_form/src/widgets/input/input_types/input_date_picker/date_picker.dart';
import 'package:flutter_form/utils/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../flutter_form.dart';

/// Select Input Types in a [FlutterFormInputDateTime]
enum FlutterFormDateTimeType {
  date,
  time,
  dateTime,
  range,
}

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
  final FlutterFormDateTimeType inputType;
  final DateFormat dateFormat;
  final DateTime? initialDate;
  final DateTimeRange? initialDateTimeRange;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);
    super.registerController(context);

    return DateTimeInputField(
      label: label,
      icon: icon,
      firstDate: firstDate,
      lastDate: lastDate,
      inputType: inputType,
      controller: controller,
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
  final FlutterFormDateTimeType dateTimeType;

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
