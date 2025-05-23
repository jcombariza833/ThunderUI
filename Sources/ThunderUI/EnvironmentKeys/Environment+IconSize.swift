//
//  Environment+IconSize.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 3/26/25.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit

@available(iOS 17.0, *)
public extension View {
  /// Sets the `IconSize` for icons within the current view hierarchy.
  ///
  /// - Parameter value: The desired icon size (e.g., `.small`, `.medium`, `.large`).
  /// - Returns: A view with the updated icon size in its environment.
  func iconSize(_ value: IconSize) -> some View {
    self._iconSize(value)
  }
}
