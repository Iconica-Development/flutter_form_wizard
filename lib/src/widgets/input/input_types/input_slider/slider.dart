import 'package:flutter/material.dart';

/// Creates a slider with the given input parameters
class SliderFormField extends FormField<double> {
  SliderFormField({
    Key? key,
    required FormFieldSetter<double> onSaved,
    required FormFieldValidator<double> validator,
    double initialValue = 0.5,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<double> state) {
              return Slider(
                value: state.value ?? initialValue,
                onChanged: (double value) {
                  state.didChange(value);
                },
              );
            });
}
