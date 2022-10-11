import 'package:flutter/material.dart';
import 'package:flutter_form/utils/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../flutter_form.dart';

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

/// Input for a plain text with extra styling used in a [FlutterForm].
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

/// Input for a multi line plain text field [FlutterForm].
///
/// Standard controller is [FlutterFormInputPlainTextController].
/// 
/// Hint can be set to set a hint inside the field.
/// 
/// MaxCharacters can be set to set a maximum amount of characters.
class FlutterFormInputMultiLine extends FlutterFormInputWidget {
  const FlutterFormInputMultiLine({
    Key? key,
    required FlutterFormInputController controller,
    Widget? label,
    this.hint,
    this.maxCharacters,
  }) : super(key: key, controller: controller, label: label);

  final String? hint;
  final int? maxCharacters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);

    super.registerController(context);

    return Column(
      children: [
        Expanded(
          child: TextFormField(
            textAlignVertical: TextAlignVertical.top,
            expands: true,
            maxLines: null,
            maxLength: maxCharacters,
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
              filled: true,
            ),
          ),
        ),
      ],
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
        return translator('Field can not be empty');
      }
    }

    return null;
  }
}
