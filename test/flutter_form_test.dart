import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Normal walk through without check page', (tester) async {
    FlutterFormController formController = FlutterFormController();

    var testField1Controller = FlutterFormInputPlainTextController(
      id: 'Field1',
    );

    var testField2Controller = FlutterFormInputPlainTextController(
      id: 'Field2',
    );

    int? onNextPageNumber;
    Map<String, dynamic>? onNextResults;

    Map<int, Map<String, dynamic>>? onFinishResults;

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: FlutterForm(
            options: FlutterFormOptions(
              nextButton: (pageNumber, checkingPages) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () async {
                      await formController.autoNextStep();
                    },
                    child: Text(pageNumber == 0
                        ? 'next1'
                        : pageNumber == 1
                            ? 'next2'
                            : 'finish'),
                  ),
                );
              },
              onFinished: (Map<int, Map<String, dynamic>> results) {
                onFinishResults = results;
              },
              onNext: (int pageNumber, Map<String, dynamic> results) {
                onNextPageNumber = pageNumber;
                onNextResults = results;
              },
              pages: [
                FlutterFormPage(
                  child: Center(
                    child: FlutterFormInputPlainText(
                      label: const Text('Field1Label'),
                      controller: testField1Controller,
                    ),
                  ),
                ),
                FlutterFormPage(
                  child: Center(
                    child: FlutterFormInputPlainText(
                      label: const Text('Field2Label'),
                      controller: testField2Controller,
                    ),
                  ),
                ),
              ],
            ),
            formController: formController,
          ),
        ),
      ),
    );

    await tester.enterText(
        find.widgetWithText(TextFormField, 'Field1Label'), 'Field1Input');
    await tester.tap(find.widgetWithText(ElevatedButton, 'next1'));
    await tester.pumpAndSettle();

    expect(0, onNextPageNumber);
    expect({'Field1': 'Field1Input'}, onNextResults);

    await tester.enterText(
        find.widgetWithText(TextFormField, 'Field2Label'), 'Field2Input');
    await tester.tap(find.widgetWithText(ElevatedButton, 'next2'));
    await tester.pumpAndSettle();

    expect(1, onNextPageNumber);
    expect({'Field2': 'Field2Input'}, onNextResults);

    expect({
      0: {'Field1': 'Field1Input'},
      1: {'Field2': 'Field2Input'}
    }, onFinishResults);
  });

  testWidgets('Normal walk through with check page', (tester) async {
    FlutterFormController formController = FlutterFormController();

    var testField1Controller = FlutterFormInputPlainTextController(
      id: 'Field1',
    );

    var testField2Controller = FlutterFormInputPlainTextController(
      id: 'Field2',
    );

    int? onNextPageNumber;
    Map<String, dynamic>? onNextResults;

    Map<int, Map<String, dynamic>>? onFinishResults;

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: FlutterForm(
            options: FlutterFormOptions(
              checkPage: const CheckPage(),
              nextButton: (pageNumber, checkingPages) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () async {
                      await formController.autoNextStep();
                    },
                    child: Text(pageNumber == 0
                        ? 'next1'
                        : pageNumber == 1
                            ? 'next2'
                            : 'finish'),
                  ),
                );
              },
              onFinished: (Map<int, Map<String, dynamic>> results) {
                onFinishResults = results;
              },
              onNext: (int pageNumber, Map<String, dynamic> results) {
                onNextPageNumber = pageNumber;
                onNextResults = results;
              },
              pages: [
                FlutterFormPage(
                  child: Center(
                    child: FlutterFormInputPlainText(
                      label: const Text('Field1Label'),
                      controller: testField1Controller,
                    ),
                  ),
                ),
                FlutterFormPage(
                  child: Center(
                    child: FlutterFormInputPlainText(
                      label: const Text('Field2Label'),
                      controller: testField2Controller,
                    ),
                  ),
                ),
              ],
            ),
            formController: formController,
          ),
        ),
      ),
    );

    await tester.enterText(
        find.widgetWithText(TextFormField, 'Field1Label'), 'Field1Input');
    await tester.tap(find.widgetWithText(ElevatedButton, 'next1'));
    await tester.pumpAndSettle();

    expect(0, onNextPageNumber);
    expect({'Field1': 'Field1Input'}, onNextResults);

    await tester.enterText(
        find.widgetWithText(TextFormField, 'Field2Label'), 'Field2Input');
    await tester.tap(find.widgetWithText(ElevatedButton, 'next2'));
    await tester.pumpAndSettle();

    expect(1, onNextPageNumber);
    expect({'Field2': 'Field2Input'}, onNextResults);

    await tester.tap(find.text('Field1Input'));
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextFormField, 'Field1Label'), 'Field1Input2');
    await tester.tap(find.widgetWithText(ElevatedButton, 'next1'));
    await tester.pumpAndSettle();

    expect(0, onNextPageNumber);
    expect({'Field1': 'Field1Input2'}, onNextResults);

    await tester.tap(find.widgetWithText(ElevatedButton, "finish"));
    await tester.pumpAndSettle();

    expect({
      0: {'Field1': 'Field1Input2'},
      1: {'Field2': 'Field2Input'}
    }, onFinishResults);
  });

  testWidgets('Wrong input with mandatory validator', (tester) async {
    FlutterFormController formController = FlutterFormController();

    var testField1Controller = FlutterFormInputPlainTextController(
      id: 'Field1',
      mandatory: true,
    );

    int? onNextPageNumber;
    Map<String, dynamic>? onNextResults;

    Map<int, Map<String, dynamic>>? onFinishResults;

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: FlutterForm(
            options: FlutterFormOptions(
              nextButton: (pageNumber, checkingPages) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () async {
                      await formController.autoNextStep();
                    },
                    child: const Text('finish'),
                  ),
                );
              },
              onFinished: (Map<int, Map<String, dynamic>> results) {
                // print('finished results: $results');
                onFinishResults = results;
              },
              onNext: (int pageNumber, Map<String, dynamic> results) {
                // print('nextResults: $pageNumber: $results');
                onNextPageNumber = pageNumber;
                onNextResults = results;
              },
              pages: [
                FlutterFormPage(
                  child: Center(
                    child: FlutterFormInputPlainText(
                      label: const Text('Field1Label'),
                      controller: testField1Controller,
                    ),
                  ),
                ),
              ],
            ),
            formController: formController,
          ),
        ),
      ),
    );

    await tester.tap(find.widgetWithText(ElevatedButton, 'finish'));
    await tester.pumpAndSettle();

    expect(null, onNextPageNumber);
    expect(null, onNextResults);

    final errorMessageFinder = find.text('Field can not be empty');

    expect(errorMessageFinder, findsOneWidget);

    await tester.enterText(
        find.widgetWithText(TextFormField, 'Field1Label'), 'Field1Input');
    await tester.tap(find.widgetWithText(ElevatedButton, 'finish'));
    await tester.pumpAndSettle();

    expect(0, onNextPageNumber);
    expect({'Field1': 'Field1Input'}, onNextResults);

    expect({
      0: {'Field1': 'Field1Input'},
    }, onFinishResults);
  });
}
