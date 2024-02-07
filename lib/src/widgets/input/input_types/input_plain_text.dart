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
class FlutterFormInputPlainText extends FlutterFormInputWidget<String> {
  const FlutterFormInputPlainText({
    required super.controller,
    super.key,
    super.focusNode,
    super.label,
    this.decoration,
    this.textAlignVertical,
    this.expands = false,
    this.maxLines = 1,
    this.scrollPadding,
    this.maxLength,
    this.keyboardType,
    this.enabled = true,
    this.style,
    this.textCapitalization = TextCapitalization.none,
  });

  final InputDecoration? decoration;
  final TextAlignVertical? textAlignVertical;
  final bool expands;
  final int? maxLines;
  final int? maxLength;
  final EdgeInsets? scrollPadding;
  final TextInputType? keyboardType;
  @override
  final bool enabled;
  final TextStyle? style;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    var _ = getTranslator(context);

    super.registerController(context);

    var inputDecoration = decoration ??
        InputDecoration(
          label: label ?? const Text('Plain text'),
        );

    return input.FlutterFormInputPlainText(
      style: style,
      enabled: enabled,
      scrollPadding: scrollPadding ?? const EdgeInsets.all(20.0),
      initialValue: controller.value,
      focusNode: focusNode,
      onSaved: controller.onSaved,
      validator: (value) => controller.onValidate(value, _),
      onChanged: (value) => controller.onChanged?.call(value),
      onFieldSubmitted: (value) => controller.onSubmit?.call(value),
      decoration: inputDecoration,
      textAlignVertical: textAlignVertical,
      expands: expands,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
    );
  }
}

/// Input for a multi line plain text field [FlutterForm].
///
/// Standard controller is [FlutterFormInputPlainTextController].
///
/// Hint can be set to set a hint inside the field.
///
/// MaxCharacters can be set to set a maximum amount of characters.
class FlutterFormInputMultiLine extends StatelessWidget {
  const FlutterFormInputMultiLine({
    required this.controller,
    super.key,
    this.focusNode,
    this.label,
    this.hint,
    this.maxCharacters,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.sentences,
  });

  final FlutterFormInputController<String> controller;
  final Widget? label;
  final FocusNode? focusNode;

  final String? hint;
  final int? maxCharacters;
  final bool enabled;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    var _ = getTranslator(context);

    return input.FlutterFormInputMultiLine(
      enabled: enabled,
      label: label,
      hint: hint,
      focusNode: focusNode,
      initialValue: controller.value,
      maxCharacters: maxCharacters,
      onChanged: controller.onChanged,
      onSaved: controller.onSaved,
      validator: (v) => controller.onValidate(v, _),
      textCapitalization: textCapitalization,
    );
  }
}

/// Controller for plain text used by a [FlutterFormInputWidget] used in a
/// [FlutterForm].
///
/// Mainly used by [FlutterFormInputPlainText].
class FlutterFormInputPlainTextController
    implements FlutterFormInputController<String> {
  FlutterFormInputPlainTextController({
    required this.id,
    this.mandatory = false,
    this.value,
    this.checkPageTitle,
    this.checkPageDescription,
    this.onChanged,
    this.onSubmit,
  });

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
  void onSaved(String? value) {
    this.value = value;
  }

  @override
  String? onValidate(
    String? value,
    String Function(String, {List<String>? params}) translator,
  ) {
    if (mandatory) {
      if (value == null || value.isEmpty) {
        return translator('Field can not be empty');
      }
    }

    return null;
  }
}
