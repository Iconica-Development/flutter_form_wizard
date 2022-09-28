import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../flutter_form.dart';
import 'package:flutter_form/next_shell/translation_service.dart';

/// Input for plain text input used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputPlainTextController].
class FlutterFormInputPlainText extends FlutterFormInputWidget {
  const FlutterFormInputPlainText({
    Key? key,
    required FlutterFormInputController controller,
    Widget? label,
  }) : super(key: key, controller: controller, label: label);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);

    super.registerController(context);

    return TextFormField(
      initialValue: controller.value,
      onSaved: (value) => controller.onSaved(value),
      validator: (value) => controller.onValidate(value, _),
      decoration: InputDecoration(
        label: label ?? const Text("Plain text"),
      ),
    );
  }
}

/// Input for an plain text with extra styling used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputPlainTextController].
class FlutterFormInputPlainTextWhiteWithBorder extends FlutterFormInputWidget {
  const FlutterFormInputPlainTextWhiteWithBorder({
    Key? key,
    required FlutterFormInputController controller,
    Widget? label,
    this.hint,
  }) : super(key: key, controller: controller, label: label);

  final String? hint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);

    super.registerController(context);

    return TextFormField(
      initialValue: controller.value,
      onSaved: (value) => controller.onSaved(value),
      validator: (value) => controller.onValidate(value, _),
      decoration: InputDecoration(
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        isDense: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF979797)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF979797)),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}

/// Controller for plain text used by a [FlutterFormInputWidget] used in a [FlutterForm].
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
  void onSaved(String value) {
    this.value = value;
  }

  @override
  String? onValidate(String? value,
      String Function(String, {List<String>? params}) translator) {
    if (mandatory) {
      if (value == null || value.isEmpty) {
        return translator('Field cannot be empty');
      }
    }

    return null;
  }
}
