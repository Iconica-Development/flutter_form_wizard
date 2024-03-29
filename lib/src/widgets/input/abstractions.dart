// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/src/utils/formstate.dart' as fs;

/// Abstract class for the input widgets used in a [FlutterForm].
///
/// The controller [FlutterFormInputController] has to be given to the widget.
/// Which controller is used determines how to value will be handled.
///
/// label is a standard parameter to normally sets the label of the input.
///
/// [registerController] should be called to register the given [controller] to
/// the form page.
abstract class FlutterFormInputWidget<T> extends StatelessWidget {
  const FlutterFormInputWidget({
    required this.controller,
    super.key,
    this.focusNode,
    this.label,
    this.enabled = true,
  });

  /// The [controller] which determines how the value is handled and how the
  /// value is shown on the checkpage.
  final FlutterFormInputController<T> controller;

  /// [label] is a standard parameter to normally sets the label of the input.
  final Widget? label;

  final FocusNode? focusNode;

  final bool enabled;

  /// [registerController] should be called to register the given [controller]
  /// to the form page.
  void registerController(BuildContext context) {
    var localController =
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
/// [value] is a way to set a initial value and will be the value when change
/// by the user.
///
/// [mandatory] determines if the input is mandatory.
///
/// [checkPageTitle] is a function where you can transform the value from the
/// input into something representable.
/// This value will be given when defining the check page widgets.
/// If this function is not set, the value will be used as is.
/// Example:
/// ``` dart
/// checkPageTitle: (dynamic amount) {
///   return "$amount persons";
/// },
/// ```
///
/// [checkPageDescription] is the same as checkPageTitle but for the
/// description. If null no description will be shown.
///
/// [onChanged] can be set to get the value whenever the user changes it.
/// Should not be used to save the value.
///
/// [onSubmit] can be set to get the value whenever the user submits it.
/// Should not be used to save the value.
///
/// [onSaved] goes of when the save function is called for the page if
/// [onValidate] return null.
///
/// [onValidate] is used to validate the given input by the user.
abstract class FlutterFormInputController<T> {
  /// The [id] determines the key in the [Map] returned by the [FlutterForm].
  String? id;

  /// [value] is a way to set a initial value and will be the value when
  /// change by the user.
  T? value;

  /// [mandatory] determines if the input is mandatory.
  bool mandatory = false;

  /// [checkPageTitle] is a function where you can transform the value from the
  /// input into something representable.
  /// This value will be given when defining the check page widgets.
  /// If this function is not set, the value will be used as is.
  /// Example:
  /// ``` dart
  /// checkPageTitle: (dynamic amount) {
  ///   return "$amount persons";
  /// },
  /// ```
  String Function(T? value)? checkPageTitle;

  /// [checkPageDescription] is the same as checkPageTitle but for the
  /// description.
  /// If null no description will be shown.
  String Function(T? value)? checkPageDescription;

  /// [onChanged] can be set to get the value whenever the user changes it.
  /// Should not be used to save the value.
  void Function(T? value)? onChanged;

  /// [onSubmit] can be set to get the value whenever the user submits it.
  /// Should not be used to save the value.
  void Function(T? value)? onSubmit;

  /// [onSaved] goes of when the save function is called for the page if
  /// [onValidate] return null.
  void onSaved(T? value);

  /// [onValidate] is used to validate the given input by the user.
  String? onValidate(
    T? value,
    String validationMessage,
  );
}
