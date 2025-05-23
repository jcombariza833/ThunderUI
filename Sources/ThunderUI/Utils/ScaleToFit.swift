//
//  ScaleToFit.swift
//  ThunderUI
//
//  Created by Juan Combariza on 4/11/24.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit

/// A view extension that applies a scaling effect to fit the view within a given content size.
@available(iOS 17.0, *)
public extension View {
  /// Scales the view proportionally to fit within the specified `originalSize`.
  ///
  /// - Parameter originalSize: The size to scale the view to fit within.
  /// - Returns: A view that scales to fit the specified size.
  func effectScaleToFit(_ originalSize: CGSize) -> some View {
    self._effectScaleToFit(originalSize)
  }
}
