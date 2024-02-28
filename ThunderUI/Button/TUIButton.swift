//
//  TUIButton.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/6/23.
//

import SwiftUI

// MARK: - Congifuration
public enum ButtonViewStyle{
  case elevated
  case outlined
}

public struct TUIButtonConfig: Equatable {
  var foregroundColor: Color
  var backgroundColor: Color
  var style: ButtonViewStyle
  var resize: ResizeStyle

  public init(
    foregroundColor: Color = .white,
    backgroundColor: Color = .blue,
    style: ButtonViewStyle = .elevated,
    resize: ResizeStyle = .fit
  ) {
    self.foregroundColor = foregroundColor
    self.backgroundColor = backgroundColor
    self.style = style
    self.resize = resize
  }
}

// MARK: - Style
public struct TUIButtonStyle: ButtonStyle {
  var config: TUIButtonConfig = .init()

  public init(config: TUIButtonConfig = .init() ) {
    self.config = config
  }

  public func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .font(.system(size: 14))
      .textCase(.uppercase)
      .bold()
      .frame(
        minWidth: 0,
        maxWidth: config.resize == .fill ? .infinity : nil,
        minHeight: 0,          maxHeight: 36
      )
      .padding(.horizontal, 16)
      .overlay(config.style == .outlined ?
               RoundedRectangle(cornerRadius:5)
        .strokeBorder(
          config.backgroundColor,
          lineWidth: configuration.isPressed ? 2.0 : 1.0) : nil
      )
      .background(config.style == .outlined ? .white.opacity(0.0) : config.backgroundColor)
      .foregroundColor(config.style == .outlined ? config.backgroundColor: config.foregroundColor)
      .cornerRadius(5)
      .shadow(
        color: config.style == .outlined ? .gray.opacity(0.0) : .gray,
        radius: 5, x: 2, y: 2
      )
      .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
      .opacity(configuration.isPressed ? 0.9 : 1.0)

  }
}

// MARK: - Preview
let buttonConfig1 = TUIButtonConfig()
let buttonConfig2 = TUIButtonConfig(foregroundColor: .red,
                                    backgroundColor: .red,
                                    style: .outlined,
                                    resize: .fill)

#Preview {
  Group {
    Button {
      print("My action")
    } label: {
      HStack {
        Image(systemName: "square.and.arrow.up")
          .frame(width: 17, height: 17, alignment: .center)
          .foregroundColor(.black)
        Text("Share")
          .bold()
          .font(.system(size: 17))
          .textCase(.uppercase)
          .foregroundColor(.black)
      }
    }
    .buttonStyle(TUIButtonStyle())


    Button("Share", systemImage: "square.and.arrow.up") {
      print("My action")
    }
    .buttonStyle(TUIButtonStyle(config: buttonConfig2))


  }
  .padding()
}
