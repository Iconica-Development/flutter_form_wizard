import 'package:flutter/material.dart';

/// The options used to set parameters to a [ShellForm].
///
/// The pages determine what pages the pageview will contain via a [List] of [ShellFormPage]s.
///
/// Using a checkpage gives the ability for the user to check all input values before commiting by [CheckPage].
/// If [checkpage] is null no check page will be shown.
///
/// [nextButton] and [backButton] are both a way to give controls to user.
/// Both are just plain widgets used in a [Stack]. So the widgets can be aligned where ever.
/// The formcontroller of [ShellForm] should be used to give control to the widgets/buttons.
///
/// [onFinished] and [onNext] are both callbacks which give the users results.
/// onNext is called when the user goes to the next page.
/// onFinished is called when the form is finished. When checkpage is set onFinished is called when the checkpage is finished.
class ShellFormOptions {
  final List<ShellFormPage> pages;

  final CheckPage? checkPage;
  final Widget Function(int pageNumber, bool checkingPages)? nextButton;
  final Widget Function(int pageNumber, bool checkingPages, int pageAmount)?
      backButton;
  final void Function(Map<int, Map<String, dynamic>>) onFinished;
  final void Function(int pageNumber, Map<String, dynamic>) onNext;

  const ShellFormOptions({
    required this.pages,
    this.checkPage,
    this.nextButton,
    this.backButton,
    required this.onFinished,
    required this.onNext,
  });
}

/// The defines every page in a [ShellForm].
class ShellFormPage {
  final Widget child;

  ShellFormPage({
    required this.child,
  });
}

/// CheckPage is used to set a check page at the end of a [ShellForm].
/// A CheckPage is a page where the user can check all input values before commiting.
///
/// [title] is the widget shown at the top of the page.
///
/// [mainAxisAlignment] is the alignment of the check widgets.
///
/// [inputCheckWidget] determines how every input is represented on the page.
/// [title] is the value given in the input.
/// This input can be modified by setting the [checkPageTitle] of that input controller.
///
/// Same for the [description] but if the description is not set in the input controller no description will be given.
///
/// [onPressed] can be set so that when the user triggers it the user will be sent back to the page including the input.
/// Here the user can modify the input and save it. Afterwards the user will be sent back to the check page.
class CheckPage {
  final Widget? title;
  final MainAxisAlignment mainAxisAlignment;
  final Widget Function(String title, String? description, Function onPressed)?
      inputCheckWidget;

  const CheckPage({
    this.title,
    this.inputCheckWidget,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
}
