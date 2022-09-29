import 'package:flutter/material.dart';
import 'package:flutter_form/utils/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../flutter_form.dart';

/// Input for an email used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputEmailController].
class FlutterFormInputEmail extends FlutterFormInputWidget {
  const FlutterFormInputEmail({
    Key? key,
    required FlutterFormInputController controller,
    Widget? label,
  }) : super(
          key: key,
          controller: controller,
          label: label,
        );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);

    super.registerController(context);

    return TextFormField(
      initialValue: controller.value,
      onSaved: (value) {
        controller.onSaved(value);
      },
      validator: (value) => controller.onValidate(value, _),
      decoration: InputDecoration(
        focusColor: Theme.of(context).primaryColor,
        label: label ?? const Text("Email"),
      ),
    );
  }
}

/// Controller for emails used by a [FlutterFormInputWidget] used in a [FlutterForm].
///
/// Mainly used by [FlutterFormInputEmail].
class FlutterFormInputEmailController
    implements FlutterFormInputController<String> {
  FlutterFormInputEmailController({
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

      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return translator('shell.form.error.email.notValid');
      }
    }

    return null;
  }
}
