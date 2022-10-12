import 'package:flutter/material.dart';
import 'package:flutter_form/utils/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../flutter_form.dart';

/// Input for plain text input used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputPlainTextController].
class FlutterFormInputPlainText extends FlutterFormInputWidget<String> {
  const FlutterFormInputPlainText({
    Key? key,
    required FlutterFormInputController<String> controller,
    Widget? label,
    this.decoration,
    this.textAlignVertical,
    this.expands = false,
    this.maxLines,
    this.maxLength,
  }) : super(key: key, controller: controller, label: label);

  final InputDecoration? decoration;
  final TextAlignVertical? textAlignVertical;
  final bool expands;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);

    super.registerController(context);

    InputDecoration inputDecoration = decoration ??
        InputDecoration(
          label: label ?? const Text("Plain text"),
        );

    return TextFormField(
      initialValue: controller.value,
      onSaved: (value) => controller.onSaved(value),
      validator: (value) => controller.onValidate(value, _),
      onChanged: (value) => controller.onChanged?.call(value),
      decoration: inputDecoration,
      textAlignVertical: textAlignVertical,
      expands: expands,
      maxLines: maxLines,
      maxLength: maxLength,
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
    Key? key,
    required this.controller,
    this.label,
    this.hint,
    this.maxCharacters,
  }) : super(key: key);

  final FlutterFormInputController<String> controller;
  final Widget? label;

  final String? hint;
  final int? maxCharacters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FlutterFormInputPlainText(
            label: label,
            controller: controller,
            textAlignVertical: TextAlignVertical.top,
            expands: true,
            maxLines: null,
            maxLength: maxCharacters,
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
    this.onChanged,
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
  void onSaved(String? value) {
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
