//
//  TUILink.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/6/23.
//

import SwiftUI

// MARK: - Congifuration
public struct TUILinkConfig {
  var activeColor: Color?
  var inactiveColor: Color?
  var size: CGFloat?

  public init(
    activeColor: Color? = nil,
    inactiveColor: Color? = nil,
    size: CGFloat? = nil
  ) {
    self.activeColor = activeColor
    self.inactiveColor = inactiveColor
    self.size = size
  }
}

// MARK: - Style
public struct TUILinkStyle: ButtonStyle {
  var config: TUILinkConfig = .init()

  public func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
      .font(.system(size: config.size ?? 14))
        .textCase(.uppercase)
        .underline()
        .bold()
        .foregroundColor(configuration.isPressed ? config.activeColor ?? .gray : config.inactiveColor ?? .gray)
        .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
        .opacity(configuration.isPressed ? 0.9 : 1.0)

  }
}

// MARK: - View
public struct TUILink: View {
  var text: String
  var config: TUILinkConfig
  var action: (() -> ())

  public init(
    _ text: String,
    config: TUILinkConfig = .init(),
    action: @escaping (() -> ())
  ) {
    self.text = text
    self.config = config
    self.action = action
  }

  public var body: some View {
    Button(action: {
      action()
    }, label: {
      Text(text)
    })
    .buttonStyle(TUILinkStyle(config: config))
  }
}

// MARK: - Preview
let linkConfig = TUILinkConfig(activeColor: .red, inactiveColor: .blue, size: 24)
#Preview {
  Group {
    TUILink("Register") {
      print("Link")
    }

    TUILink("Register", config: linkConfig) {
      print("Link")
    }
  }

}
