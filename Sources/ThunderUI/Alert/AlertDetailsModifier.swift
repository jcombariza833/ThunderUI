//
//  AlertDetailsModifier.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 2/23/25.
//

import SwiftUI
@_exported import ThunderUIKit

@available(iOS 17.0, *)
extension View {
  /// Presents an alert or confirmation dialog based on the provided `AlertDetailsModel`.
  ///
  /// - Parameter details: A binding to an optional `AlertDetailsModel` used to configure and trigger the alert.
  /// - Returns: A view that conditionally presents an alert using the provided model.
  public func alert(details: Binding<AlertDetailsModel?>) -> some View {
    self._alert(details: details)
  }
}
