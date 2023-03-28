// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;
import '../../../../../flutter_form.dart';

/// Input for a password used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputEmailController].
class FlutterFormInputPassword extends FlutterFormInputWidget<String> {
  const FlutterFormInputPassword({
    Key? key,
    required FlutterFormInputController<String> controller,
    FocusNode? focusNode,
    Widget? label,
  }) : super(
            key: key,
            controller: controller,
            focusNode: focusNode,
            label: label);

  @override
  Widget build(BuildContext context) {
    super.registerController(context);

    String Function(String, {List<String>? params}) _ =
        getTranslator(context);

    return input.FlutterFormInputPassword(
      initialValue: controller.value,
      focusNode: focusNode,
      onSaved: (value) => controller.onSaved(value),
      validator: (value) => controller.onValidate(value, _),
      onChanged: (value) => controller.onChanged?.call(value),
      onFieldSubmitted: (value) => controller.onSubmit?.call(value),
    );
  }
}

/// Controller for passwords used by a [FlutterFormInputWidget] used in a [ShellFrom].
///
/// Mainly used by [FlutterFormInputPassword].
class FlutterFormInputPasswordController
    implements FlutterFormInputController<String> {
  FlutterFormInputPasswordController({
    required this.id,
    this.mandatory = true,
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
  void onSaved(dynamic value) {
    this.value = value;
  }

  @override
  String? onValidate(String? value,
      String Function(String, {List<String>? params}) translator) {
    if (mandatory) {
      if (value == null || value.isEmpty) {
        return translator('Field can not be empty');
      }

      if (value.length < 6) {
        return translator('Field should be atleast 6 characters long');
      }
    }

    return null;
  }
}
