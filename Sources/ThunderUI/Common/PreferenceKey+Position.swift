//
//  PreferenceKey+Position.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/7/23.
//

import SwiftUI
import Foundation
@_exported import ThunderUIKit

@available(iOS 17.0, *)
extension View {
  /// Captures the view's frame (position and size) within a specified coordinate space
  /// and binds it to the given `CGRect` binding.
  ///
  /// - Parameters:
  ///   - binding: A binding to a `CGRect` where the view’s frame will be stored.
  ///   - coordinateSpace: The coordinate space in which to measure the view's frame.
  /// - Returns: A modified view that writes its frame to the provided binding.
  public func capturePosition(
    in binding: Binding<CGRect>,
    in coordinateSpace: some CoordinateSpaceProtocol
  ) -> some View {
    self._capturePosition(in: binding, in: coordinateSpace)
  }
}
