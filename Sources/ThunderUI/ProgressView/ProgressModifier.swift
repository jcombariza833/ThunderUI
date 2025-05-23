//
//  ProgressModifier.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 2/25/25.
//

import SwiftUI
@_exported import ThunderUIKit

/// A view extension for displaying an activity indicator based on a bound `ProgressModel`.
@available(iOS 17.0, *)
public extension View {
  /// Overlays a progress indicator (e.g., spinner or status icon) when the model is non-nil.
  ///
  /// - Parameter model: A binding to an optional `ProgressModel` used to control visibility and content.
  /// - Returns: A view that conditionally displays a progress overlay.
  func activityIndicator(model: Binding<ProgressModel?>) -> some View {
    self._activityIndicator(model: model)
  }
}
