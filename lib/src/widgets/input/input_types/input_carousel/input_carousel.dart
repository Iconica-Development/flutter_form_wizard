// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/flutter_form.dart';
import 'package:flutter_input_library/flutter_input_library.dart' as input;

/// Input for a carousel of items used in a [FlutterForm].
///
/// [items] will be the [Widget]s to be displayed in the carousel.
///
/// Standard controller is [FlutterFormInputCarouselController].
///
/// Height sets the height of the inputfield. Default to 425.
class FlutterFormInputCarousel extends FlutterFormInputWidget<int> {
  const FlutterFormInputCarousel({
    Key? key,
    required FlutterFormInputController<int> controller,
    Widget? label,
    required this.items,
    this.height = 425,
  }) : super(key: key, controller: controller, label: label);

  final List<Widget> items;
  final double height;

  @override
  Widget build(BuildContext context) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context);

    super.registerController(context);

    return input.FlutterFormInputCarousel(
      onSaved: (value) => controller.onSaved(value),
      validator: (value) => controller.onValidate(value, _),
      onChanged: controller.onChanged,
      initialValue: controller.value ?? 0,
      items: items,
      height: height,
    );
  }
}

/// Controller for the carousel used by a [FlutterFormInputWidget] used in a [FlutterForm].
///
/// Mainly used by [FlutterFormInputCarousel].
class FlutterFormInputCarouselController
    implements FlutterFormInputController<int> {
  FlutterFormInputCarouselController({
    required this.id,
    this.mandatory = true,
    this.value,
    this.checkPageTitle,
    this.checkPageDescription,
    this.onChanged,
  });

  @override
  String? id;

  @override
  int? value;

  @override
  bool mandatory;

  @override
  String Function(int? value)? checkPageTitle;

  @override
  String Function(int? value)? checkPageDescription;

  @override
  void Function(int? value)? onChanged;

  @override
  void Function(int? value)? onSubmit;

  @override
  void onSaved(int? value) {
    this.value = value;
  }

  @override
  String? onValidate(
      int? value, String Function(String, {List<String>? params}) translator) {
    if (mandatory) {}

    return null;
  }
}
