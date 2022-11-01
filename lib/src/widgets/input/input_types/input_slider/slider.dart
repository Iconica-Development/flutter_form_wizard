// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';

/// Creates a slider with the given input parameters
class SliderFormField extends FormField<double> {
  SliderFormField({
    Key? key,
    required FormFieldSetter<double> onSaved,
    required FormFieldValidator<double> validator,
    void Function(double value)? onChanged,
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
                  onChanged?.call(value);

                  state.didChange(value);
                },
              );
            });
}
