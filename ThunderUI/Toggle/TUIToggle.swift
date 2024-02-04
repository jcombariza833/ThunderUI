//
//  TUIToggle.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/6/23.
//

import SwiftUI

// MARK: - Congifuration
public struct TUIToggleConfig {
  var foregroundColor: Color
  var colorOn: Color
  var iconOn: String
  var colorOff: Color
  var iconOff: String
  var resize: ResizeStyle

  public init(
    foregroundColor: Color = .black,
    colorOn: Color = .blue,
    iconOn: String = "checkmark",
    colorOff: Color = .gray.opacity(0.8),
    iconOff: String = "xmark",
    resize: ResizeStyle = .fill
  ) {
    self.foregroundColor = foregroundColor
    self.colorOn = colorOn
    self.iconOn = iconOn
    self.colorOff = colorOff
    self.iconOff = iconOff
    self.resize = resize
  }
}

// MARK: - Style
public struct TUIToggleStyle: ToggleStyle {
  var config: TUIToggleConfig

  public init(config: TUIToggleConfig = .init()) {
    self.config = config
  }

  public func makeBody(configuration: Self.Configuration) -> some View {
    HStack {
      configuration.label
        .font(.system(size: 14))
        .textCase(.uppercase)
        .bold()
        .foregroundColor(config.foregroundColor)
      if config.resize == .fill {
        Spacer()
      }
      RoundedRectangle(cornerRadius: 20)
        .foregroundColor(configuration.isOn ? config.colorOn : config.colorOff)
        .frame(width: 51, height: 31, alignment: .center)
          .overlay(
              Circle()
                  .foregroundColor(.white)
                  .padding(.all, 3)
                  .overlay(
                    Image(systemName: configuration.isOn ? config.iconOn : config.iconOff)
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .font(Font.title.weight(.black))
                          .frame(width: 8, height: 8, alignment: .center)
                          .foregroundColor(configuration.isOn ? config.colorOn : config.colorOff)
                  )
                  .offset(x: configuration.isOn ? 11 : -11, y: 0)
                  .animation(.linear(duration: 0.1), value: configuration.isOn)
          )
          .onTapGesture { configuration.isOn.toggle() }
    }

  }
}

let toggleConfig1 = TUIToggleConfig(colorOn: .red, colorOff: .black)
let toggleConfig2 = TUIToggleConfig(foregroundColor: .blue,colorOn: .red, iconOn: "", colorOff: .black)
let toggleConfig3 = TUIToggleConfig(resize: .fit)

struct TogglePreview: View {
  var config: TUIToggleConfig = .init()
  @State var isOn = false
  var body: some View {
    Toggle("Enable", isOn: $isOn)
      .toggleStyle(TUIToggleStyle(config: config))
      .padding()
  }
}


#Preview {
  Group {
    TogglePreview()
    TogglePreview(config: toggleConfig2)
    Toggle(isOn: .constant(true), label: {
      /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/.underline()
    })
    .toggleStyle(TUIToggleStyle(config: toggleConfig1))
    .padding()
    Toggle(isOn: .constant(true), label: {
      Text("").underline()
    })
    .toggleStyle(TUIToggleStyle(config: toggleConfig3))
    .padding()
  }
}
