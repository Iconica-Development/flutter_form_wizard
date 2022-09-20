import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form/next_shell/translation_service.dart';

import '../../../../flutter_form.dart';

/// Input for an email used in a [ShellForm].
///
/// Standard controller is [ShellFormInputEmailController].
class ShellFormInputEmail extends ShellFormInputWidget {
  const ShellFormInputEmail({
    Key? key,
    required ShellFormInputController controller,
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

/// Controller for emails used by a [ShellFormInputWidget] used in a [ShellForm].
///
/// Mainly used by [ShellFormInputEmail].
class ShellFormInputEmailController
    implements ShellFormInputController<String> {
  ShellFormInputEmailController({
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
