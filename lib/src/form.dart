import 'package:flutter/material.dart';
import 'package:flutter_form/utils/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../flutter_form.dart';
import 'utils/form_page_controller.dart';
import 'utils/formstate.dart' as fs;

/// A wrapper for flutters [Form] that can be controlled by a controller and provides multiple pre-defined input types/fields
/// [FlutterForm] also provides multi page forms and a check page for validation.
///
/// A [FlutterFormController] has to be given to control what happens to values and pages within the FlutterForm.
///
/// [FlutterFormOptions] have to be provided to control the appearance of the form.
///
/// WARNING Define your FormInputController above your FlutterForm. Otherwise when rebuild the controller will differ from the registered ones.
/// ``` dart
/// FlutterFormInputEmailController emailController =
///     FlutterFormInputEmailController(id: 'email');
/// FlutterFormInputPasswordController passwordController =
///     FlutterFormInputPasswordController(id: 'password');
///
/// FlutterForm(
///   formController: FlutterFormController,
///   options: FlutterFormOptions(
///     onFinished: (Map<int, Map<String, dynamic>> results) {
///       // print(results);
///     },
///     onNext: (int pageNumber, Map<String, dynamic> results) {
///       // print("Results page $pageNumber: $results");
///     },
///     nextButton: (int pageNumber, bool checkingPages) {
///       return Align(
///         alignment: Alignment.bottomCenter,
///         child: Padding(
///           padding: const EdgeInsets.only(
///             bottom: 25,
///           ),
///           child: ElevatedButton(
///             onPressed: () {
///               FlutterFormController.autoNextStep();
///             },
///             child: Text(checkingPages ? "Save" : "Next Page"),
///           ),
///         ),
///       );
///     },
///     backButton: (int pageNumber, bool checkingPages, int pageAmount) {
///       if (pageNumber != 0) {
///         if (!checkingPages || pageNumber >= pageAmount) {
///           return Align(
///             alignment: Alignment.topLeft,
///             child: IconButton(
///               padding: EdgeInsets.zero,
///               splashRadius: 29,
///               onPressed: () {
///                 FlutterFormController.previousStep();
///               },
///               icon: const Icon(Icons.chevron_left),
///             ),
///           );
///         }
///       }
///       return Container();
///     },
///     pages: [
///       FlutterFormPage(
///         child: Column(
///           mainAxisAlignment: MainAxisAlignment.center,
///           children: [
///             Align(
///               alignment: Alignment.centerLeft,
///               child: Padding(
///                 padding: const EdgeInsets.symmetric(horizontal: 46),
///                 child: Column(
///                   crossAxisAlignment: CrossAxisAlignment.start,
///                   children: const [
///                     SizedBox(
///                       height: 60,
///                     ),
///                     Text(
///                       'Inloggen',
///                       style: TextStyle(
///                         fontSize: 25,
///                         fontWeight: FontWeight.w900,
///                       ),
///                     ),
///                   ],
///                 ),
///               ),
///             ),
///             const Spacer(),
///             FlutterFormInputEmail(controller: emailController),
///             const SizedBox(
///               height: 25,
///             ),
///             FlutterFormInputPassword(controller: passwordController),
///             const Spacer(),
///           ],
///         ),
///       ),
///     ],
///     checkPage: CheckPage(
///       title: const Text(
///         "All entered info: ",
///         style: TextStyle(
///           fontSize: 25,
///           fontWeight: FontWeight.w900,
///         ),
///       ),
///       inputCheckWidget:
///           (String title, String? description, Function onPressed) {
///         return GestureDetector(
///           onTap: () async {
///             await onPressed();
///           },
///           child: Container(
///             width: MediaQuery.of(context).size.width * 0.9,
///             padding: const EdgeInsets.only(
///               top: 18,
///               bottom: 16,
///               right: 18,
///               left: 27,
///             ),
///             decoration: BoxDecoration(
///               color: Colors.white,
///               borderRadius: BorderRadius.circular(10),
////               boxShadow: [
///                 BoxShadow(
///                   color: const Color(0xFF000000).withOpacity(0.20),
///                   blurRadius: 5,
///                 ),
///               ],
///             ),
///             child: Column(
///               children: [
///                 Row(
///                   children: [
///                     Container(
///                       width: 30,
///                       height: 30,
///                       decoration: BoxDecoration(
///                         color: const Color(0xFFD8D8D8),
///                         borderRadius: BorderRadius.circular(5),
///                       ),
///                     ),
///                     const SizedBox(
///                       width: 16,
///                     ),
///                     Text(
///                       title,
///                       style: const TextStyle(
///                         fontWeight: FontWeight.w900,
///                         fontSize: 20,
///                       ),
///                     ),
///                     const Spacer(),
///                     const Icon(Icons.arrow_forward),
///                   ],
///                 ),
///                 if (description != null)
///                   const SizedBox(
///                     height: 9,
///                   ),
///                 if (description != null)
///                   Text(
///                     description,
///                     style: const TextStyle(fontSize: 16),
///                   )
///               ],
///             ),
///           ),
///         );
///       },
///       mainAxisAlignment: MainAxisAlignment.start,
///     ),
///   ),
/// ),
/// ```
class FlutterForm extends ConsumerStatefulWidget {
  const FlutterForm({
    Key? key,
    required this.options,
    required this.formController,
  }) : super(key: key);

  final FlutterFormOptions options;
  final FlutterFormController formController;

  @override
  ConsumerState<FlutterForm> createState() => _FlutterFormState();
}

class _FlutterFormState extends ConsumerState<FlutterForm> {
  late FlutterFormController _formController;

  @override
  void initState() {
    super.initState();

    _formController = widget.formController;

    _formController.setFlutterFormOptions(widget.options);

    List<GlobalKey<FormState>> keys = [];

    for (FlutterFormPage _ in widget.options.pages) {
      keys.add(GlobalKey<FormState>());
    }

    _formController.setKeys(keys);

    _formController.addListener(() {
      setState(() {});
    });

    List<FlutterFormPageController> controllers = [];

    for (int i = 0; i < widget.options.pages.length; i++) {
      controllers.add(FlutterFormPageController());
    }

    _formController.setFormPageControllers(controllers);
  }

  @override
  Widget build(BuildContext context) {
    var _ = getTranslator(context, ref);

    return Stack(
      children: [
        PageView(
          scrollDirection: _formController._options.scrollDirection,
          controller: _formController.getPageController(),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (int i = 0; i < widget.options.pages.length; i++) ...[
              Form(
                key: _formController.getKeys()[i],
                child: fs.FormState(
                  formController: _formController.getFormPageControllers()[i],
                  child: CustomScrollView(
                    physics: _formController._options.scrollPhysics ??
                        const ClampingScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: widget.options.pages[i].child,
                      ),
                    ],
                  ),
                ),
              ),
            ],
            if (widget.options.checkPage != null)
              Column(
                children: [
                  if (widget.options.checkPage!.title != null)
                    widget.options.checkPage!.title!,
                  Expanded(
                    child: CustomScrollView(
                      physics: _formController._options.scrollPhysics ??
                          const ClampingScrollPhysics(),
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            mainAxisAlignment:
                                widget.options.checkPage!.mainAxisAlignment,
                            children: getResultWidgets(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
        widget.options.nextButton != null
            ? widget.options.nextButton!(_formController.getCurrentStep(),
                _formController.getCheckpages())
            : Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    await _formController.autoNextStep();
                  },
                  child: Text(_formController.getCurrentStep() >=
                          widget.options.pages.length - 1
                      ? "Finish"
                      : "Next"),
                ),
              ),
        if (widget.options.backButton != null)
          widget.options.backButton!(
            _formController.getCurrentStep(),
            _formController.getCheckpages(),
            widget.options.pages.length,
          ),
      ],
    );
  }

  List<Widget> getResultWidgets() {
    List<Widget> widgets = [];

    _formController.getAllResults().forEach(
      (pageNumber, pageResults) {
        pageResults.forEach((inputId, inputResult) {
          FlutterFormInputController? inputController = _formController
              .getFormPageControllers()[pageNumber]
              .getController(inputId);

          if (inputController != null) {
            if (widget.options.checkPage!.inputCheckWidget != null) {
              widgets.add(
                widget.options.checkPage!.inputCheckWidget!(
                  inputController.id ?? '',
                  inputController.checkPageTitle != null
                      ? inputController.checkPageTitle!(inputController.value)
                      : inputController.value.toString(),
                  inputController.checkPageDescription != null
                      ? inputController
                          .checkPageDescription!(inputController.value)
                      : null,
                  () async {
                    await _formController.jumpToPage(pageNumber);
                  },
                ),
              );
            } else {
              widgets.add(
                GestureDetector(
                  onTap: () async {
                    await _formController.jumpToPage(pageNumber);
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD8D8D8),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            inputController.checkPageTitle != null
                                ? inputController.checkPageTitle!(inputResult)
                                : inputResult.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward),
                        ],
                      ),
                      if (inputController.checkPageDescription != null)
                        const SizedBox(
                          height: 9,
                        ),
                      if (inputController.checkPageDescription != null)
                        Text(
                          inputController.checkPageDescription!(inputResult),
                          style: const TextStyle(fontSize: 16),
                        )
                    ],
                  ),
                ),
              );
            }
          }

          widgets.add(
            const SizedBox(
              height: 25,
            ),
          );
        });
      },
    );

    return widgets;
  }
}

class FlutterFormController extends ChangeNotifier {
  late FlutterFormOptions _options;

  int _currentStep = 0;

  late List<GlobalKey<FormState>> _keys;

  bool _checkingPages = false;

  final PageController _pageController = PageController();

  late List<FlutterFormPageController> _formPageControllers;

  List<FlutterFormPageController> getFormPageControllers() {
    return _formPageControllers;
  }

  setFormPageControllers(List<FlutterFormPageController> controllers) {
    _formPageControllers = controllers;
  }

  disableCheckingPages() {
    _checkingPages = false;

    for (var controller in _formPageControllers) {
      controller.clearControllers();
    }
  }

  Future<void> autoNextStep() async {
    if (_currentStep >= _options.pages.length && _options.checkPage != null) {
      _options.onFinished(getAllResults());
    } else {
      if (validateAndSaveCurrentStep()) {
        FocusManager.instance.primaryFocus?.unfocus();

        _options.onNext(
            _currentStep, _formPageControllers[_currentStep].getAllValues());

        if (_currentStep >= _options.pages.length - 1 &&
                _options.checkPage == null ||
            _currentStep >= _options.pages.length &&
                _options.checkPage != null) {
          _options.onFinished(getAllResults());
        } else {
          if (_checkingPages) {
            _currentStep = _options.pages.length;

            notifyListeners();

            await _pageController.animateToPage(_currentStep,
                duration: const Duration(milliseconds: 250),
                curve: Curves.ease);
          } else {
            _currentStep += 1;

            if (_currentStep >= _options.pages.length &&
                _options.checkPage != null) {
              _checkingPages = true;
            }

            notifyListeners();

            await _pageController.animateToPage(_currentStep,
                duration: const Duration(milliseconds: 250),
                curve: Curves.ease);
          }
        }
      }
    }
  }

  Future<void> previousStep() async {
    _currentStep -= 1;

    _checkingPages = false;

    notifyListeners();

    await _pageController.animateToPage(
      _currentStep,
      duration: const Duration(milliseconds: 250),
      curve: Curves.ease,
    );
  }

  Future<void> jumpToPage(int pageNumber) async {
    _currentStep = pageNumber;

    notifyListeners();

    await _pageController.animateToPage(
      _currentStep,
      duration: const Duration(milliseconds: 250),
      curve: Curves.ease,
    );
  }

  bool validateAndSaveCurrentStep() {
    if (_keys[_currentStep].currentState!.validate()) {
      _keys[_currentStep].currentState!.save();

      return true;
    }

    return false;
  }

  Map<String, dynamic> getCurrentStepResults() {
    return _formPageControllers[_currentStep].getAllValues();
  }

  Future<void> nextStep() async {
    _options.onNext(
        _currentStep, _formPageControllers[_currentStep].getAllValues());

    _currentStep += 1;

    if (_currentStep >= _options.pages.length && _options.checkPage != null) {
      _checkingPages = true;
    }

    notifyListeners();

    await _pageController.animateToPage(_currentStep,
        duration: const Duration(milliseconds: 250), curve: Curves.ease);
  }

  finishForm() {
    _options.onFinished(getAllResults());
  }

  Map<int, Map<String, dynamic>> getAllResults() {
    Map<int, Map<String, dynamic>> allValues = {};

    for (var i = 0; i < _options.pages.length; i++) {
      allValues.addAll({i: _formPageControllers[i].getAllValues()});
    }
    return allValues;
  }

  setFlutterFormOptions(FlutterFormOptions options) {
    _options = options;
  }

  setKeys(List<GlobalKey<FormState>> keys) {
    _keys = keys;
  }

  List<GlobalKey<FormState>> getKeys() {
    return _keys;
  }

  int getCurrentStep() {
    return _currentStep;
  }

  bool getCheckpages() {
    return _checkingPages;
  }

  PageController getPageController() {
    return _pageController;
  }
}
