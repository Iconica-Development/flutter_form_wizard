import 'package:flutter/material.dart';
import 'package:flutter_form/src/widgets/input/input_types/input_date_picker/date_picker.dart';
import 'package:flutter_form/utils/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../flutter_form.dart';

/// Input for a date used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputDateController].
class FlutterFormInputDate extends FlutterFormInputWidget {
  const FlutterFormInputDate(
      {Key? key,
      required FlutterFormInputController controller,
      Widget? label,
      this.showIcon = true,
      this.icon = Icons.calendar_today,
      required this.dateFormat})
      : super(
          key: key,
          controller: controller,
          label: label,
        );
  final DateFormat dateFormat;
  final bool showIcon;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);
    super.registerController(context);

    return DateInputField(controller: controller, dateFormat: dateFormat);
  }
}

/// Controller for dates used by a [FlutterFormInputWidget] used in a [FlutterForm].
///
/// Mainly used by [FlutterFormInputDate].
class FlutterFormInputDateController
    implements FlutterFormInputController<String> {
  FlutterFormInputDateController({
    required this.id,
    this.mandatory = true,
    this.value,
    this.checkPageTitle,
    this.checkPageDescription,
  });

  @override
  String? id;

  @override
  String? value;

  @override
  bool mandatory;

  @override
  String Function(String value)? checkPageTitle;

  @override
  String Function(String value)? checkPageDescription;

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
