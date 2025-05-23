//
//  KeyboardDismisser.swift
//  ThunderUI
//
//  Created by Juan Combariza on 1/20/24.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit

/// A view extension that allows keyboard dismissal for single-focus input fields.
@available(iOS 17.0, *)
public extension View {
  /// Applies a modifier to dismiss the keyboard when tapping outside a focused field.
  ///
  /// - Parameter isFocused: A `FocusState<Bool>.Binding` indicating the current focus state.
  /// - Returns: A view that dismisses the keyboard on tap.
  func focusDismiss(_ isFocused: FocusState<Bool>.Binding) -> some View {
    self._focusDismiss(isFocused)
  }
}

/// A view extension that supports keyboard dismissal when using multiple focus values (e.g., with enums).
@available(iOS 17.0, *)
public extension View {
  /// Applies a modifier to dismiss the keyboard for multiple-focus configurations.
  ///
  /// - Parameter isFocused: A binding to an optional `FocusState<FocusedValue?>` indicating active focus.
  /// - Returns: A view that dismisses the keyboard on background tap.
  func multipleFocusDismiss<FocusedValue: Hashable>(_ isFocused: FocusState<FocusedValue?>.Binding) -> some View {
    self._multipleFocusDismiss(isFocused)
  }
}
