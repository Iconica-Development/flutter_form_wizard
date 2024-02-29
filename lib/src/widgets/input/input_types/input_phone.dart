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
    required this.validationMessage,
    super.key,
    super.focusNode,
    super.label,
    this.decoration,
    this.enabled = true,
    this.numberFieldStyle,
    this.validator,
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
  final String validationMessage;
  final String? Function(PhoneNumber?)? validator;

  @override
  Widget build(BuildContext context) {
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
      validator: validator ??
          (value) => controller.onValidate(value, validationMessage),
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
    String validationMessage,
  ) {
    if (mandatory) {
      if (value == null || value.number == null) {
        return validationMessage;
      }
    }

    return null;
  }
}
