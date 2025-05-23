//
//  Environment+IconScheme.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 3/20/25.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit

/// Defines the types of icon styling supported by the design system.
public typealias IconSchemeType = ThunderUIKit.IconSchemeType

/// A view extension for `TUIIcon` that applies a themed icon scheme.
@available(iOS 17.0, *)
public extension View where Self == TUIIcon {
  /// Applies an `IconSchemeType` to the `TUIIcon`, allowing for themed or custom styling.
  ///
  /// - Parameter value: The desired `IconSchemeType` (.primary, .error, etc.).
  /// - Returns: A `TUIIcon` view styled using the resolved scheme.
  func iconScheme(_ value: IconSchemeType) -> some View {
    self._iconScheme(value)
  }
}
