import 'package:flutter/material.dart';

class SwitchFormField extends FormField<bool> {
  SwitchFormField({
    Key? key,
    required FormFieldSetter<bool> onSaved,
    required FormFieldValidator<bool> validator,
    bool initialValue = false,
    bool autovalidate = false,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<bool> state) {
              return SwitchWidget(
                initialValue: initialValue,
                state: state,
              );
            });
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({
    this.initialValue = false,
    required this.state,
    super.key,
  });

  final bool initialValue;
  final FormFieldState<bool> state;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  late bool value = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (bool value) {
        widget.state.didChange(value);

        setState(() {
          this.value = value;
        });
      },
    );
  }
}
