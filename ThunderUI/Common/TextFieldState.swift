//
//  TextFieldState.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/8/23.
//

import Foundation
import SwiftUI

public enum TextFieldState: RawRepresentable  {
  case error
  case success
  case normalDark
  case normalLight

  public var rawValue: TUITextFieldConfig {
      switch self {
      case .error:
        return TUITextFieldConfig(color: .red, style: .outlined)
      case .success:
        return TUITextFieldConfig(color: .green, style: .outlined)
      case .normalDark:
        return TUITextFieldConfig(color: .white, style: .outlined)
      case .normalLight:
        return TUITextFieldConfig(color: .black, style: .outlined)
      }
    }

  public init?(rawValue: TUITextFieldConfig) {
    if rawValue == TUITextFieldConfig(color: .red, style: .outlined) {
      self = .error
    } else if rawValue == TUITextFieldConfig(color: .green, style: .outlined) {
      self = .success
    } else if rawValue == TUITextFieldConfig(color: .white, style: .outlined) {
      self = .normalDark
    } else if rawValue == TUITextFieldConfig(color: .black, style: .outlined) {
      self = .normalLight
    } else {
      return nil
    }
  }
}
