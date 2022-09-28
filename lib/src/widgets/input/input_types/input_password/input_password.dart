import 'package:flutter/material.dart';
import 'package:flutter_form/src/widgets/input/input_types/input_password/password.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../flutter_form.dart';

/// Input for a password used in a [FlutterForm].
///
/// Standard controller is [ShellFormInputEmailController].
class ShellFormInputPassword extends ShellFormInputWidget {
  const ShellFormInputPassword({
    Key? key,
    required ShellFormInputController controller,
    Widget? label,
  }) : super(key: key, controller: controller, label: label);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    super.registerController(context);

    return PasswordTextField(
      label: label,
      controller: controller,
    );
  }
}

/// Controller for passwords used by a [ShellFormInputWidget] used in a [ShellFrom].
///
/// Mainly used by [ShellFormInputPassword].
class ShellFormInputPasswordController
    implements ShellFormInputController<String> {
  ShellFormInputPasswordController({
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
        return translator('Field cannot be empty');
      }

      if (value.length < 6) {
        return translator('Field cannot be empty');
      }
    }

    return null;
  }
}
