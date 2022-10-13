import 'package:flutter/material.dart';
import 'package:flutter_form/utils/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form/flutter_form.dart';

import 'carousel_form.dart';

/// Input for a carousel of items used in a [FlutterForm].
///
/// [items] will be the [Widget]s to be displayed in the carousel.
///
/// Standard controller is [FlutterFormInputCarouselController].
class FlutterFormInputCarousel extends FlutterFormInputWidget<int> {
  const FlutterFormInputCarousel({
    Key? key,
    required FlutterFormInputController<int> controller,
    Widget? label,
    required this.items,
  }) : super(key: key, controller: controller, label: label);

  final List<Widget> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String Function(String, {List<String>? params}) _ =
        getTranslator(context, ref);

    super.registerController(context);

    return CarouselFormField(
      onSaved: (value) => controller.onSaved(value),
      validator: (value) => controller.onValidate(value, _),
      onChanged: controller.onChanged,
      initialValue: controller.value ?? 0,
      items: items,
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
