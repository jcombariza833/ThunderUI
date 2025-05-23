//
//  Environment+TextFieldScheme.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 3/19/25.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit


/// Represents supported styles for text fields, either predefined or custom.
public typealias TextFieldSchemeType = ThunderUIKit.TextFieldSchemeType

/// Extension for views conforming to `TUITextField` to apply a text field scheme modifier.
@available(iOS 17.0, *)
public extension View where Self: TUITextField {
  /// Applies a text field scheme to the current view using a predefined or custom scheme.
  ///
  /// - Parameter value: A `TextFieldSchemeType` value (e.g., `.primary`, `.error`, `.custom(...)`).
  /// - Returns: A view with the specified text field scheme applied.
  func textFieldScheme(_ value: TextFieldSchemeType) -> some View {
    self._textFieldScheme(value)
  }
}
