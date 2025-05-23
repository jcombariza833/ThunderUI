//
//  Environment+Resize.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 3/16/25.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit

@available(iOS 17.0, *)
public extension View {
  /// Sets the `ResizeStyle` for the view and its descendants in the environment.
  ///
  /// - Parameter value: The desired `ResizeStyle` (.fit or .fill).
  /// - Returns: A view that uses the specified resize behavior.
  func resize(_ value: ResizeStyle) -> some View {
    self._resize(value)
  }
}
