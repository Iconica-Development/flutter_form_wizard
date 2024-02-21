// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/flutter_form.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;

/// Input for plain text input used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputPlainTextController].
class FlutterFormInputPhone extends FlutterFormInputWidget<input.PhoneNumber?> {
  const FlutterFormInputPhone({
    required super.controller,
    super.key,
    super.focusNode,
    super.label,
    this.decoration,
    this.enabled = true,
    this.numberFieldStyle,
    this.dialCodeSelectorStyle,
    this.dialCodeSelectorPadding = const EdgeInsets.only(top: 6),
    this.textAlignVertical = TextAlignVertical.top,
  });

  final InputDecoration? decoration;
  @override
  final bool enabled;
  final TextStyle? numberFieldStyle;
  final TextStyle? dialCodeSelectorStyle;
  final EdgeInsets dialCodeSelectorPadding;
  final TextAlignVertical textAlignVertical;

  @override
  Widget build(BuildContext context) {
    var translator = getTranslator(context);

    super.registerController(context);

    var inputDecoration = decoration ??
        InputDecoration(
          label: label ?? const Text('Phone field'),
        );

    return input.FlutterFormInputPhone(
      numberFieldStyle: numberFieldStyle,
      dialCodeSelectorStyle: dialCodeSelectorStyle,
      enabled: enabled,
      initialValue: controller.value,
      onSaved: controller.onSaved,
      validator: (value) => controller.onValidate(value, translator),
      onChanged: (value) => controller.onChanged?.call(value),
      onFieldSubmitted: (value) => controller.onSubmit?.call(value),
      decoration: inputDecoration,
      dialCodeSelectorPadding: dialCodeSelectorPadding,
      textAlignVertical: textAlignVertical,
    );
  }
}

class FlutterFormInputPhoneController
    implements FlutterFormInputController<input.PhoneNumber?> {
  FlutterFormInputPhoneController({
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
  input.PhoneNumber? value;

  @override
  bool mandatory;

  @override
  String Function(input.PhoneNumber? value)? checkPageTitle;

  @override
  String Function(input.PhoneNumber? value)? checkPageDescription;

  @override
  void Function(input.PhoneNumber? value)? onChanged;

  @override
  void Function(input.PhoneNumber? value)? onSubmit;

  @override
  void onSaved(input.PhoneNumber? value) {
    this.value = value;
  }

  @override
  String? onValidate(
    input.PhoneNumber? value,
    String Function(String, {List<String>? params}) translator,
  ) {
    if (mandatory) {
      if (value == null || value.number == null) {
        return translator('Field can not be empty');
      }
    }

    return null;
  }
}
