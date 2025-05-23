@_exported import ThunderUIKit

public extension String {
  /// Validates whether the string is in a standard email format.
  ///
  /// - Returns: `true` if the string is a valid email address.
  func isValidEmail() -> Bool {
    self._isValidEmail()
  }

  /// Validates whether the string meets a strong password policy.
  /// Requires at least 8 characters, including uppercase, lowercase, digit, and special character.
  ///
  /// - Returns: `true` if the string is a valid password.
  func isValidPassword() -> Bool {
    self._isValidPassword()
  }

  /// Validates whether the string is a valid username.
  /// Must be alphanumeric and between 3 to 20 characters.
  ///
  /// - Returns: `true` if the string is a valid username.
  func isValidUsername() -> Bool {
    self._isValidUsername()
  }

  /// Checks whether the string contains any non-whitespace characters.
  var hasNonWhitespaceCharacters: Bool {
    self._hasNonWhitespaceCharacters
  }

  /// Trims leading and trailing whitespace and newlines from the string.
  ///
  /// - Returns: A new string without leading/trailing whitespace or newlines.
  func trim() -> String {
    self._trim()
  }
}
