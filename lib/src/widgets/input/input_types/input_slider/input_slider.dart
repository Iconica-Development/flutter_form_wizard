import 'package:flutter/material.dart';
import 'package:flutter_form/src/widgets/input/input_types/input_slider/slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form/next_shell/translation_service.dart';

import '../../../../../flutter_form.dart';

/// Input for a number value between two values via a slider. Used in a [FlutterForm].
///
/// Standard controller is [FlutterFormInputSliderController].
class FlutterFormInputSlider extends FlutterFormInputWidget {
  const FlutterFormInputSlider({
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

    return SliderFormField(
      onSaved: (value) => controller.onSaved(value),
      validator: (value) => controller.onValidate(value, _),
    );
  }
}

/// Controller for slider used by a [FlutterFormInputWidget] used in a [FlutterForm].
///
/// Mainly used by [FlutterFormInputSlider].
class FlutterFormInputSliderController
    implements FlutterFormInputController<double> {
  FlutterFormInputSliderController({
    required this.id,
    this.mandatory = true,
    this.value,
    this.checkPageTitle,
    this.checkPageDescription,
  });

  @override
  String? id;

  @override
  double? value;

  @override
  bool mandatory;

  @override
  String Function(double value)? checkPageTitle;

  @override
  String Function(double value)? checkPageDescription;

  @override
  void onSaved(double value) {
    this.value = value;
  }

  @override
  String? onValidate(double value,
      String Function(String, {List<String>? params}) translator) {
    if (mandatory) {}

    return null;
  }
}
