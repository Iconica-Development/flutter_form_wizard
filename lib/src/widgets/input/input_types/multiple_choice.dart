import 'package:flutter/material.dart';
import 'package:flutter_form_wizard/flutter_form.dart';

class FlutterFormInputMultipleChoice extends FlutterFormInputWidget<String> {
  /// Creates a [FlutterFormInputMultipleChoice].
  ///
  /// The [controller], [options], [builder], [validationMessage] parameters
  /// are required.
  /// The [key], [focusNode], [label] are optional.
  const FlutterFormInputMultipleChoice({
    required super.controller,
    required this.options,
    required this.builder,
    required this.validationMessage,
    super.focusNode,
    super.label,
    super.key,
    this.mainAxisExtent,
    this.childAspectRatio = 1,
    this.mainAxisSpacing = 0,
    this.crossAxisSpacing = 0,
    this.crossAxisCount = 3,
    this.height,
    this.shrinkwrap = true,
    this.validator,
  });

  final List<String> options;
  final double? mainAxisExtent;
  final double childAspectRatio;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final int crossAxisCount;
  final double? height;
  final bool shrinkwrap;
  final Widget Function(
    BuildContext context,
    int index,
    ValueNotifier<int?> selectedIndex,
    FlutterFormInputController controller,
    List<String> options,
    FormFieldState<String> state,
  ) builder;
  final String? Function(String? value, String validationMessage)? validator;
  final String validationMessage;

  @override
  Widget build(BuildContext context) {
    super.registerController(context);
    var selectedIndex = ValueNotifier<int?>(null);

    return FormField<String>(
      onSaved: controller.onSaved,
      validator: (value) =>
          validator?.call(value, validationMessage) ??
          controller.onValidate(value, validationMessage),
      builder: (state) => SizedBox(
        height: height,
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: options.length,
              shrinkWrap: shrinkwrap,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: mainAxisExtent,
                childAspectRatio: childAspectRatio,
                mainAxisSpacing: mainAxisSpacing,
                crossAxisSpacing: crossAxisSpacing,
                crossAxisCount: crossAxisCount,
              ),
              itemBuilder: (context, index) => ListenableBuilder(
                listenable: selectedIndex,
                builder: (context, widget) => builder.call(
                  context,
                  index,
                  selectedIndex,
                  controller,
                  options,
                  state,
                ),
              ),
            ),
            if (state.hasError)
              Text(
                state.errorText!,
                style: const TextStyle(
                  color: Color(0xFFAD3645),
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class FlutterFormInputMultipleChoiceController
    implements FlutterFormInputController<String> {
  /// Creates a [FlutterFormInputMultipleChoiceController].
  ///
  /// The [id] parameter specifies the unique identifier for the controller.
  /// The [mandatory] parameter specifies whether the input is mandatory.
  /// The [value], [checkPageTitle], [checkPageDescription], [onChanged],
  /// and [onSubmit] parameters are optional.
  FlutterFormInputMultipleChoiceController({
    required this.id,
    this.mandatory = false,
    this.value,
    this.checkPageTitle,
    this.checkPageDescription,
    this.onChanged,
    this.onSubmit,
  });

  @override
  String? id;

  @override
  String? value;

  @override
  bool mandatory;

  @override
  String Function(String? value)? checkPageTitle;

  @override
  String Function(String? value)? checkPageDescription;

  @override
  void Function(String? value)? onChanged;

  @override
  void Function(String? value)? onSubmit;

  @override
  void onSaved(String? value) {
    this.value = value;
  }

  @override
  String? onValidate(
    String? value,
    String validationMessage,
  ) {
    if (mandatory) {
      if (value == null || value.isEmpty) {
        return validationMessage;
      }
    }

    return null;
  }
}
