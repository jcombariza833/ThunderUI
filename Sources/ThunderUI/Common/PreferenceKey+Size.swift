//
//  PreferenceKey+Size.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/7/23.
//

import SwiftUI
import Foundation
@_exported import ThunderUIKit

@available(iOS 17.0, *)
extension View {
  /// Captures the size of a view and binds it to a `CGSize` binding.
  ///
  /// - Parameter binding: A binding to a `CGSize` that will receive the view’s size.
  /// - Returns: A modified view that observes and outputs its size.
  public func captureSize(in binding: Binding<CGSize>) -> some View {
    self._captureSize(in: binding)
  }
}
