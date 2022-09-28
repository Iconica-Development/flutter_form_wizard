import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/src/utils/formstate.dart' as fs;

/// Abstract class for the input widgets used in a [FlutterForm].
///
/// The controller [FlutterFormInputController] has to be given to the widget.
/// Whicht controller is used determines how to value will be handled.
///
/// label is a standard parameter to normally sets the label of the input.
abstract class FlutterFormInputWidget extends ConsumerWidget {
  const FlutterFormInputWidget({
    Key? key,
    required this.controller,
    this.label,
    String? hintText,
  }) : super(key: key);

  final FlutterFormInputController controller;
  final Widget? label;

  registerController(BuildContext context) {
    FlutterFormInputController? localController =
        fs.FormState.of(context).formController.getController(controller.id!);

    if (localController == null) {
      fs.FormState.of(context).formController.register(controller);
    }
  }
}

/// Abstract class for the controller for inputs used in a [FlutterForm].
///
/// The [id] determines the key in the [Map] returned by the [FlutterForm].
///
/// [value] is a way to set a initial value.
///
/// [mandatory] determines if the input is mandatory.
///
/// [checkPageTitle] is a function where you can transform the value from the input into something representable.
/// This value will be given when defining the check page widgets.
/// If this function is not set, the value will be used as is.
/// Example:
/// ``` dart
/// checkPageTitle: (dynamic amount) {
///   return "$amount persons";
/// },
/// ```
///
/// [checkPageDescription] is the same as checkPageTitle but for the description.
/// If null no description will be shown.
abstract class FlutterFormInputController<T> {
  String? id;
  T? value;
  bool mandatory = false;
  String Function(T value)? checkPageTitle;
  String Function(T value)? checkPageDescription;

  void onSaved(T value);

  String? onValidate(
      T value, String Function(String, {List<String>? params}) translator);
}
