import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../flutter_form.dart';
import 'package:flutter_form/next_shell/translation_service.dart';

/// Generates a [TextFormField] for passwords. It requires a [ShellFormInputController]
/// as the [controller] parameter and an optional [Widget] as [label]
class PasswordTextField extends ConsumerStatefulWidget {
  final Widget? label;
  final ShellFormInputController controller;

  const PasswordTextField({
    Key? key,
    required this.controller,
    this.label,
  }) : super(key: key);

  @override
  ConsumerState<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends ConsumerState<PasswordTextField> {
  bool obscured = true;

  @override
  Widget build(BuildContext context) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);

    return TextFormField(
      initialValue: widget.controller.value,
      obscureText: obscured,
      onSaved: (value) => widget.controller.onSaved(value),
      validator: (value) => widget.controller.onValidate(value, _),
      decoration: InputDecoration(
        label: widget.label ?? const Text("Password"),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscured = !obscured;
            });
          },
          icon: Icon(obscured ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}
