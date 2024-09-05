## 6.6.0 - September 5th 2024
- Added `onBack` callback to the `FlutterFormOptions` to detect when the back button is pressed

## 6.5.0 - July 1st 2024
- Added `FlutterFormMultipleChoice` for multiple choice selection

## 6.4.0 - June 28th 2024
- Added `FlutterFormInputDropdown` for dropdown selection
- Added style property to `FlutterFormInputEmail`

## 6.3.2 - May 15th 2024
- Loosened the dependency on intl to be more compatible with several Flutter versions

## 6.3.1 - February 29th 2024
- Removed `TranslationService` and add `validationMessage` property to fields with validation.
- Added a way to override a input field validator.
- Exposed all properties for `FlutterFormInputDateTime` provided by `flutter_input_library`.

## 6.3.0 - February 21st 2024
- Updated the `flutter_input_library` from 3.1.0 to 3.2.1
- Added `FlutterFormInputPhone` for phone number with dial code selection.
- Added `InputDecoration` parameter to the following input fields: `FlutterFormInputEmail` and `FlutterFormInputPassword`

## 6.2.5 - February 15th 2024
- Updated the `flutter_input_library` from 3.0.1 to 3.1.0

## 6.2.4 - February 9th 2024
- Updated the `flutter_input_library` from 3.0.0 to 3.0.1

## 6.2.3 - February 7th 2024
- Added CI and linter

## 6.2.2 - February 6th 2024
- Updated the `flutter_input_library` from 2.6.0 to 3.0.0

## 6.2.1 - January 12th 2024
- Pass on the `initialValue` property to FlutterFormMultiLine

## 6.2.0 - December 14th 2023
- Pass on the `textCapitalization` property to FlutterFormPlainText and FlutterFormMultiLine

## 6.1.8 - December 6th 2023
- Pass on the style property to the FlutterFormPlainText input widget
- Bump `flutter_input_library` to version 2.5.0

## 6.1.7 - November 1st 2023
- Pass on the show icon property to flutter form input date time widget

## 6.1.6 - October 26th 2023
- Add enabled property to FlutterFormInputPlainText and FlutterFormInputDateTime

## 6.1.5 - October 26th 2023
- Bump `flutter_input_library` to version 2.4.0

## 6.1.4 - October 26th 2023
- Bump `flutter_input_library` to version 2.3.0

## 6.1.3 - September 26th 2023
- Fix date format for date controller

## 6.1.2 - August 11th 2023
- Bump `flutter_input_library` to version 2.2.1

## 6.1.1 - August 10th 2023
- Bump `flutter_input_library` to version 2.2.0

## 6.1.0 - May 12th 2023
- Make compatible with Flutter 3.10

## 6.0.0 - March 28th 2023
- Bump `flutter_input_library` to version 2.0.0
- Remove unnecessary `riverpod` dependency

## 5.0.9 - January 18th 2023
- `flutter_input_library` add initial time picker parameter

## 5.0.8 - January 18th 2023
- `flutter_input_library` add focusNode option to `FlutterFormInputMultiLine`

## 5.0.7 - January 12th 2023
- `flutter_input_library` add styling text datetime fix

## 5.0.6 - January 12th 2023
- `flutter_input_library` datetime validator fix

## 5.0.5 - January 12th 2023
- Expose translations

## 5.0.4 - January 12th 2023
- Add FocusNode option to inputs

## 5.0.0 - November 29th 2022
- `flutter_input_library` now enforces 24h time requirements

## 4.0.3 - November 29th 2022
- Change from input to `flutter_input_library`

## 4.0.2 - November 29th 2022
- Name change to flutter_form_wizard

## 2.0.1 - October 27th 2022
- onChange of switch input not firing fixed

## 2.0.0 - October 26th 2022
- Added the id of the input field on the input check widget.
- Ability to set the height of the carousel input field.
- InputController now contains the onSubmit callback.

## 1.0.2 - October 13th 2022
- Added forgotten icon parameter on date input field and scroll padding on text input field

## 1.0.1 - October 13th 2022
- Added forgotten onChanged parameter on date input field

## 1.0.0 - October 13th 2022
- Fix: Proper use of generics
- Input controllers now have an onChange.
- Added switch input field

## 0.2.0 - October 13th 2022
- Added date input widget

## 0.1.0 - October 12th 2022
- Added a multi-line plain text input widget
- Ability to set the scroll direction of the page view
- Ability to set the scroll physics of the pages' scroll view.

## 0.0.2 - October 10th 2022
- Initial release
