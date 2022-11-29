// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/flutter_form.dart';
import 'package:flutter_form_wizard/src/widgets/input/input_types/input_switch/input_switch_field.dart';
import 'package:flutter_form_wizard/utils/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Input for a boolean switch. Used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputSwitchController].
class FlutterFormInputSwitch extends FlutterFormInputWidget<bool> {
  const FlutterFormInputSwitch({
    Key? key,
    required FlutterFormInputController<bool> controller,
    Widget? label,
  }) : super(key: key, controller: controller, label: label);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);

    super.registerController(context);

    return SwitchFormField(
      onSaved: (value) {
        controller.onSaved(value);
      },
      onChanged: controller.onChanged,
      validator: (value) => controller.onValidate(value, _),
      initialValue: controller.value ?? false,
    );
  }
}

/// Controller for the switch used by a [FlutterFormInputWidget] used in a [FlutterForm].
///
/// Mainly used by [FlutterFormInputSwitch].
class FlutterFormInputSwitchController
    implements FlutterFormInputController<bool> {
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
      bool? value, String Function(String, {List<String>? params}) translator) {
    return null;
  }
}
