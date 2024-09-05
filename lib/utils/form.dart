// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';

/// The options used to set parameters to a [FlutterForm].
///
/// The pages determine what pages the pageview will contain via a [List] of
/// [FlutterFormPage]s.
///
/// Using a checkpage gives the ability for the user to check all input values
/// before commiting by [CheckPage].
/// If [checkPage] is null no check page will be shown.
///
/// [nextButton] and [backButton] are both a way to give controls to user.
/// Both are just plain widgets used in a [Stack]. So the widgets can be
/// aligned where ever.
/// The formcontroller of [FlutterForm] should be used to give control to the widgets/buttons.
///
/// [onFinished] and [onNext] are both callbacks which give the users results.
/// [onNext] is called when the user goes to the next page.
/// [onBack] is called when the user goes back a page.
/// [onFinished] is called when the form is finished. When checkpage is set
/// [onFinished] is called when the checkpage is finished.
///
/// [scrollDirection] can be set to change the Axis on which the pageview
/// slides. Defaults to horizontal.
///
/// [scrollPhysics] can be set to set the scroll phyisics of the scroll views
/// in each page. Default to [ClampingScrollPhysics].
class FlutterFormOptions {
  const FlutterFormOptions({
    required this.pages,
    required this.onFinished,
    required this.onNext,
    this.onBack,
    this.checkPage,
    this.nextButton,
    this.backButton,
    this.scrollDirection = Axis.horizontal,
    this.scrollPhysics,
  });
  final List<FlutterFormPage> pages;

  final CheckPage? checkPage;
  final Widget Function(int pageNumber, bool checkingPages)? nextButton;
  final Widget Function(int pageNumber, bool checkingPages, int pageAmount)?
      backButton;
  final void Function(Map<int, Map<String, dynamic>>) onFinished;
  final void Function(int pageNumber, Map<String, dynamic>) onNext;

  /// [onBack] is called when the user goes back a page. The [pageNumber] is the
  /// page the user is going back to. Not the page that the user was on when the
  /// user pressed the back button.
  final void Function(int pageNumber)? onBack;
  final Axis scrollDirection;
  final ScrollPhysics? scrollPhysics;
}

/// The defines every page in a [FlutterForm].
class FlutterFormPage {
  FlutterFormPage({
    required this.child,
  });
  final Widget child;
}

/// [CheckPage] is used to set a check page at the end of a [FlutterForm].
/// A [CheckPage] is a page where the user can check all input values before
/// commiting.
///
/// [title] is the widget shown at the top of the page.
///
/// [mainAxisAlignment] is the alignment of the check widgets.
///
/// [inputCheckWidget] determines how every input is represented on the page.
/// [title] is the value given in the input.
/// This input can be modified by setting the [checkPageTitle] of that input
/// controller.
///
/// Same for the [description] but if the description is not set in the input
/// controller no description will be given.
///
/// [onPressed] can be set so that when the user triggers it the user will be
/// sent back to the page including the input.
/// Here the user can modify the input and save it. Afterwards the user will be
/// sent back to the check page.
class CheckPage {
  const CheckPage({
    this.title,
    this.inputCheckWidget,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final Widget? title;
  final MainAxisAlignment mainAxisAlignment;
  final Widget Function(
    String id,
    String title,
    String? description,
    Function onPressed,
  )? inputCheckWidget;
}
