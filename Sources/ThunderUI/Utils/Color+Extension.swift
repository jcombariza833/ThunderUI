//
//  Color+Extension.swift
//  ThunderUI
//
//  Created by Juan Combariza on 2/3/24.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit

@available(iOS 17.0, *)
public extension Color {
  /// Initializes a SwiftUI `Color` from a hexadecimal string (e.g., "#RRGGBB").
  ///
  /// - Parameter hex: A hex string, with or without a leading "#".
  init(hex: String) {
    self.init(_hex: hex)
  }

  /// Returns the hexadecimal string representation of the color (e.g., "#RRGGBB").
  var hexString: String {
    self._hexString
  }
}

// MARK: - UIKit UIColor Extensions

public extension UIColor {
  /// Initializes a `UIColor` from a hexadecimal string (e.g., "#RRGGBB").
  ///
  /// - Parameter hex: A hex string with or without a leading "#".
  convenience init(hex: String) {
    self.init(_hex: hex)
  }

  /// Returns the hex string representation of the UIColor (e.g., "#RRGGBB").
  var hexString: String {
    self._hexString
  }
}
