# Flutter Image Picker

Flutter Form is a package you can use to create a single or multi page form with premade or custom inputfields.

## Features

Single or multi page form with the ability to define the navigational buttons.
A handfull premade fields with their own controllers.
Full posibilty to create custom inputfields and controllers which can be used along side the premade fields and controllers.
A checkpage where the end user can check his answers and jump back to the page of an inputfield to change his answer without going through the whole form.
The look of the checkpage answers can be set own desire.

## Setup

To use this package, add `flutter_form` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

## How To Use

See the [Example Code](example/lib/form_example.dart) for an example on how to use this package.

WARNING Make sure to define your ShellFormInputControllers above your Flutter Form and not inside each page. This prevents that the used controllers differ from the registered ones.

Flutter Form has two paramaters: options and formController. Each of these parameters' own parameters will be explained in tabels below.

Options:

| Parameter  | Explaination                                                                                                                                                                  |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| checkPage  | If this is set the form will feature a checkpage at the end so the end user can verify and alter his answers.                                                                 |
| nextButton | The button which is put in the stack of the Form. An onTap has to be implemented and should call to the FormController. Standard call is autoNextStep().                      |
| backButton | Same as the nextButton. A widget that is put in the stack of the Form. An onTap has to be implemented and should call to the FormController. Standard call is previousStep(). |
| onFinised  | The callback that will be called when the last page is finished. If checkPage is enabled this will call after the checkPage is passed.                                        |
| onNext     | The callback that is called when the user finishes a page. PageNumber is also provided.                                                                                       |

FormController:

| Parameter                    | Explaination                                                                                                              |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| getFormPageControllers()     | The getter to get all FormPageControllers. This should not be needed/called.                                              |
| setFormPageControllers()     | The setter for the FormPageControllers. This shoudl not be needed/called.                                                 |
| disableCheckPages()          | This should be called when the user goes back to a page where the user alters an answer that alters the rest of the form. |
| autoNextStep()               | This should be called under the nextButton of the FormOptions if no special actions are required.                         |
| previousStep()               | This should be called under the backButton of the FormOptions.                                                            |
| jumpToPage()                 | A way to jump to a different page if desired.                                                                             |
| validateAndSaveCurretnStep() | Calling the validate, and possibly save, for the current step. Returns the result of the validate.                        |
| getCurrentStepResults()      | Get the result of the current step. Mostly called after validateAndSaveCurrentStep return true.                           |
| nextStep()                   | Called to go to the next step. This is does not do anything else like autoNextStep does do.                               |
| finishForm()                 | Calls the onFinished of the form options.                                                                                 |

## Issues

Please file any issues, bugs or feature request as an issue on our [GitHub](https://github.com/Iconica-Development/flutter_form/pulls) page. Commercial support is available if you need help with integration with your app or services. You can contact us at [support@iconica.nl](mailto:support@iconica.nl).

## Want to contribute

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), please carefully review our [contribution guide](../CONTRIBUTING.md) and send us your [pull request](URL TO PULL REQUEST TAB IN REPO).

## Author

`flutter-form` for Flutter is developed by [Iconica](https://iconica.nl). You can contact us at <support@iconica.nl>
