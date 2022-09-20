import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../flutter_form.dart';
import 'package:flutter_form/next_shell/translation_service.dart';

class PasswordTextfield extends ConsumerStatefulWidget {
  final Widget? label;
  final ShellFormInputController controller;

  const PasswordTextfield({
    Key? key,
    required this.controller,
    this.label,
  }) : super(key: key);

  @override
  ConsumerState<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends ConsumerState<PasswordTextfield> {
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
