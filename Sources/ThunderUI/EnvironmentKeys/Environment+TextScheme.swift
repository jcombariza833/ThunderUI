//
//  Environment+TextScheme.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 4/26/25.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit

/// Defines available text scheme styles for typography, covering headers, body text, and more.
public typealias TextSchemeType = ThunderUIKit.TextSchemeType

/// Extension to apply a text scheme to `TUIText` views.
@available(iOS 17.0, *)
public extension View where Self == TUIText {
  /// Applies a text scheme to the text view using a predefined or custom scheme.
  ///
  /// - Parameter value: The desired `TextSchemeType` (e.g., `.h1`, `.body2`, `.custom(...)`).
  /// - Returns: A `TUIText` view styled using the specified scheme.
  func textScheme(_ value: TextSchemeType) -> some View {
    self._textScheme(value)
  }
}
