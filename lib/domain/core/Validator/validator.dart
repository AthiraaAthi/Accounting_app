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
}
