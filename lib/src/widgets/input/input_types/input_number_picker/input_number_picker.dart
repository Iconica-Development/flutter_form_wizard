import 'package:flutter/material.dart';
import 'package:flutter_form/utils/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../flutter_form.dart';

import 'numberpicker.dart';

/// Input for a number used in a [FlutterForm].
///
/// [minValue] sets the minimal value of the picker.
/// [maxValue] sets the maximal value of the picker.
///
/// Standard controller is [FlutterFormInputNumberPickerController].
class FlutterFormInputNumberPicker extends FlutterFormInputWidget {
  const FlutterFormInputNumberPicker({
    Key? key,
    required FlutterFormInputController controller,
    Widget? label,
    this.minValue = 0,
    this.maxValue = 100,
  })  : assert(minValue < maxValue),
        super(key: key, controller: controller, label: label);

  final int minValue;
  final int maxValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);

    super.registerController(context);

    return NumberPickerFormField(
      minValue: minValue,
      maxValue: maxValue,
      onSaved: (value) {
        controller.onSaved(value);
      },
      validator: (value) => controller.onValidate(value, _),
      initialValue: controller.value ?? minValue,
    );
  }
}

/// Controller for the numberPicker used by a [FlutterFormInputWidget] used in a [FlutterForm].
///
/// Mainly used by [FlutterFormInputNumberPicker].
class NumberPickerFormField extends FormField<int> {
  NumberPickerFormField({
    Key? key,
    required FormFieldSetter<int> onSaved,
    required FormFieldValidator<int> validator,
    int initialValue = 0,
    bool autovalidate = false,
    int minValue = 0,
    int maxValue = 100,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<int> state) {
              return NumberPicker(
                minValue: minValue,
                maxValue: maxValue,
                value: initialValue,
                onChanged: (int value) {
                  state.didChange(value);
                },
                itemHeight: 35,
                itemCount: 5,
              );
            });
}

class FlutterFormInputNumberPickerController
    implements FlutterFormInputController<int> {
  FlutterFormInputNumberPickerController({
    required this.id,
    this.mandatory = true,
    this.value,
    this.checkPageTitle,
    this.checkPageDescription,
  });

  @override
  String? id;

  @override
  int? value;

  @override
  bool mandatory;

  @override
  String Function(int value)? checkPageTitle;

  @override
  String Function(int value)? checkPageDescription;

  @override
  void onSaved(int value) {
    this.value = value;
  }

  @override
  String? onValidate(
      int value, String Function(String, {List<String>? params}) translator) {
    if (mandatory) {}

    return null;
  }
}
