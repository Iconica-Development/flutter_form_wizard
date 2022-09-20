import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_form/next_shell/form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_example/example_pages/age_page.dart';
import 'package:form_example/example_pages/carousel_page.dart';
import 'package:form_example/example_pages/check_page.dart';
import 'package:form_example/example_pages/name_page.dart';

class FormExample extends ConsumerStatefulWidget {
  const FormExample({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormExampleState();
}

class _FormExampleState extends ConsumerState<FormExample> {
  final ShellFormController formController = ShellFormController();

  final String checkPageText = "All entered info: ";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.height / 40;

    return Scaffold(
      body: Center(
        child: ShellForm(
          formController: formController,
          options: ShellFormOptions(
            onFinished: (Map<int, Map<String, dynamic>> results) {
              print("Totale resultaten: $results");
              Navigator.of(context).pushNamed('/thanks');
            },
            onNext: (int pageNumber, Map<String, dynamic> results) {
              print("Resultaten pagina $pageNumber: $results");
            },
            nextButton: (int pageNumber, bool checkingPages) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: size.height / 20,
                  ),
                  child: SizedBox(
                    height: size.height / 15,
                    width: size.width / 1.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.black,
                        textStyle: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        formController.autoNextStep();
                      },
                      child: Text(checkingPages ? "Save" : "Next Page"),
                    ),
                  ),
                ),
              );
            },
            backButton: (int pageNumber, bool checkingPages, int pageAmount) {
              if (pageNumber != 0) {
                if (!checkingPages || pageNumber >= pageAmount) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(
                          top: size.height / 20,
                          left: size.width / 15,
                        ),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: const Color(0xFFD8D8D8).withOpacity(0.50),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          splashRadius: 29,
                          onPressed: () {
                            formController.previousStep();
                          },
                          icon: const Icon(Icons.chevron_left),
                        )),
                  );
                }
              }
              return Container();
            },
            pages: [
              AgePage().returnPage(size, fontSize, 1, 3),
              NamePage().returnPage(size, fontSize, 2, 3),
              CarouselPage().returnPage(size, fontSize, 3, 3),
            ],
            checkPage: CheckPageExample()
                .showCheckpage(context, size, fontSize, checkPageText),
          ),
        ),
      ),
    );
  }
}
