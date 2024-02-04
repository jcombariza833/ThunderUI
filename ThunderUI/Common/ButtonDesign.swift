//
//  ButtonDesign.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/8/23.
//

import Foundation

public enum ButtonDesign: RawRepresentable  {
  case black
  case red
  case white
  case redBorder
  case whiteBorder

  private static let blackButtonConfig = TUIButtonConfig(foregroundColor: .white,
                                                         backgroundColor: .black,
                                                         style: .elevated,
                                                         resize: .fill)
  private static let redButtonConfig = TUIButtonConfig(foregroundColor: .white,
                                                         backgroundColor: .red,
                                                         style: .elevated,
                                                         resize: .fill)
  private static let whiteButtonConfig = TUIButtonConfig(foregroundColor: .black,
                                                         backgroundColor: .white,
                                                         style: .elevated,
                                                         resize: .fill)
  private static let redBroderButtonConfig = TUIButtonConfig(foregroundColor: .red,
                                                             backgroundColor: .red,
                                                             style: .outlined,
                                                             resize: .fill)
  private static let whiteBroderButtonConfig = TUIButtonConfig(foregroundColor: .black,
                                                             backgroundColor: .white,
                                                             style: .outlined,
                                                             resize: .fill)


  public var rawValue: TUIButtonConfig {
      switch self {
      case .black:
        return ButtonDesign.blackButtonConfig
      case .red:
        return ButtonDesign.redButtonConfig
      case .white:
        return ButtonDesign.whiteButtonConfig
      case .redBorder:
        return ButtonDesign.redBroderButtonConfig
      case .whiteBorder:
        return ButtonDesign.whiteBroderButtonConfig
      }
    }

  public init?(rawValue: TUIButtonConfig) {
    if rawValue == ButtonDesign.blackButtonConfig {
      self = .black
    } else if rawValue == ButtonDesign.redButtonConfig {
      self = .red
    } else if rawValue == ButtonDesign.whiteButtonConfig {
      self = .white
    } else if rawValue == ButtonDesign.redBroderButtonConfig {
      self = .redBorder
    } else if rawValue == ButtonDesign.whiteBroderButtonConfig {
      self = .whiteBorder
    } else {
      return nil
    }
  }
}
