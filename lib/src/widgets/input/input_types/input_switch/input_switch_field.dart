import 'package:flutter/material.dart';

class SwitchFormField extends FormField<bool> {
  SwitchFormField({
    Key? key,
    required FormFieldSetter<bool> onSaved,
    required FormFieldValidator<bool> validator,
    bool initialValue = false,
    bool autovalidate = false,
    void Function(bool? value)? onChanged,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<bool> state) {
              return SwitchWidget(
                initialValue: initialValue,
                state: state,
                onChanged: onChanged,
              );
            });
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({
    this.initialValue = false,
    required this.state,
    this.onChanged,
    super.key,
  });

  final bool initialValue;
  final FormFieldState<bool> state;
  final void Function(bool? value)? onChanged;

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
        widget.onChanged?.call(value);

        widget.state.didChange(value);

        setState(() {
          this.value = value;
        });
      },
    );
  }
}
