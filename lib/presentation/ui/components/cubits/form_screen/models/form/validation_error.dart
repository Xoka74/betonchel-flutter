enum ValidationError {
  invalid,
  required,
  tooLong,
  tooShort,
  containsSpaces;

  String? toErrorString({
    required String? requiredError,
    String? invalidError,
    String? tooLongError,
    String? tooShortError,
    String? containsSpacesError,
  }) {
    switch (this) {
      case ValidationError.required:
        return requiredError;
      case ValidationError.invalid:
        return invalidError;
      case ValidationError.tooLong:
        return tooLongError ?? invalidError;
      case ValidationError.tooShort:
        return tooShortError ?? invalidError;
      case ValidationError.containsSpaces:
        return containsSpacesError ?? invalidError;
    }
  }
}
