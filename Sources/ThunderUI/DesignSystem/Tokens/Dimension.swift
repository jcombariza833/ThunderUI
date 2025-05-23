//
//  Dimension.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 2/23/25.
//

import Foundation
@_exported import ThunderUIKit

/// Common spacing constants based on a 4-point scale (e.g., `x1` = 4, `x2` = 8, etc.).
/// Intended for consistent spacing throughout the UI.
public extension CGFloat {
  static let x1 = CGFloat._x1
  static let x2 = CGFloat._x2
  static let x3 = CGFloat._x3
  static let x4 = CGFloat._x4
  static let x5 = CGFloat._x5
  static let x6 = CGFloat._x6
  static let x7 = CGFloat._x7
  static let x8 = CGFloat._x8
  static let x9 = CGFloat._x9
  static let x10 = CGFloat._x10
  static let x11 = CGFloat._x11
  static let x12 = CGFloat._x12
  static let x13 = CGFloat._x13
  static let x14 = CGFloat._x14

  static func custom(_ multiplier: Int) -> CGFloat {
    _custom(multiplier)
  }
}
