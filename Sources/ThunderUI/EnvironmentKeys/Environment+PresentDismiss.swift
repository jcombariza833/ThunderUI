//
//  Environment+PresentDismiss.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 3/9/25.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit

@available(iOS 17.0, *)
public extension View {
  /// Injects a custom view to be used as the left icon in downstream views that observe `leftIcon`.
  ///
  /// - Parameter content: A view builder producing the left icon view.
  /// - Returns: A modified view with the left icon set in the environment.
  func leftIcon<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
    self._leftIcon(content: content)
  }

  /// Injects a custom view to be used as the right icon in downstream views that observe `rightIcon`.
  ///
  /// - Parameter content: A view builder producing the right icon view.
  /// - Returns: A modified view with the right icon set in the environment.
  func rightIcon<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
    self._rightIcon(content: content)
  }
}
