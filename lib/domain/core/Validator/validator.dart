import 'package:form_field_validator/form_field_validator.dart';

class FieldValidators {
  static final requiredValidator = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
  ]);

  static final phoneValidator = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
    MinLengthValidator(10, errorText: 'Enter a valid phone number'),
    MaxLengthValidator(10,
        errorText: 'Enter a valid phone number (Don\'t use +91)'),
  ]);
  static final amountValidator = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
    PatternValidator(r'^\d+(\.\d{1,2})?$', errorText: 'Enter a valid amount'),
    MaxLengthValidator(10, errorText: 'Amount is too long'),
    MinLengthValidator(1, errorText: 'Enter a valid amount'),
  ]);
  static final unrequiredPhoneValidator = MultiValidator([
    MinLengthValidator(10, errorText: 'Enter a valid phone number'),
    MaxLengthValidator(10,
        errorText: 'Enter a valid phone number (Don\'t use +91)'),
  ]);
  static final unrequiredAmountValidator = MultiValidator([
    PatternValidator(r'^\d+(\.\d{1,2})?$', errorText: 'Enter a valid amount'),
    MaxLengthValidator(10, errorText: 'Amount is too long'),
    MinLengthValidator(1, errorText: 'Enter a valid amount'),
  ]);
  static final optionalValidator = MultiValidator([]);
}
