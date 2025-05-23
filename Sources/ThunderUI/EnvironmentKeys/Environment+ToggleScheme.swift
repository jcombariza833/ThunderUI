//
//  Environment+ToggleScheme.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 4/21/25.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit

/// Defines visual styles for toggles, including default, themed, and custom configurations.
public typealias ToggleSchemeType = ThunderUIKit.ToggleSchemeType

/// Extension for toggle views conforming to `TUIToggle` to apply a styling scheme.
@available(iOS 17.0, *)
public extension View where Self: TUIToggle {
  /// Applies a toggle scheme to the view using a predefined or custom style.
  ///
  /// - Parameter value: A `ToggleSchemeType` describing the desired style.
  /// - Returns: A toggle view with the applied style.
  func toggleScheme(_ value: ToggleSchemeType) -> some View {
    self._toggleScheme(value)
  }
}
