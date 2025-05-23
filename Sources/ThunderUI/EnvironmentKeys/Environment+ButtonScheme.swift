//
//  Environment+ButtonScheme.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 3/16/25.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit

/// Represents the different types of button schemes supported by the design system.
public typealias ButtonSchemeType = ThunderUIKit.ButtonSchemeType

@available(iOS 17.0, *)
public extension View where Self: TUIButton {
  /// Applies a button scheme to the current button view using a design-system style or a custom scheme.
  ///
  /// - Parameter value: The desired `ButtonSchemeType` (e.g., `.primary`, `.error`, or `.custom(...)`).
  /// - Returns: A view with the specified button scheme applied in the environment.
  func buttonScheme(_ value: ButtonSchemeType) -> some View {
    self._buttonScheme(value)
  }
}
