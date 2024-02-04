//
//  TUITextField.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/6/23.
//

import SwiftUI

// MARK: - Congifuration
public enum TextFieldViewStyle {
  case standard
  case filled
  case outlined
}

public struct TUITextFieldConfig: Equatable {
  public var color: Color
  public var style: TextFieldViewStyle

  public init(
    color: Color = .blue,
    style: TextFieldViewStyle = .standard
  ) {
    self.color = color
    self.style = style
  }
}
// MARK: - Style
public struct TUITextFieldStyle: TextFieldStyle {

  var text: String
  var placeholder: String?
  var config: TUITextFieldConfig

  @State private var isEditing = false

  public init(
    text: String,
    placeholder: String? = nil,
    config: TUITextFieldConfig = .init()
  ) {
    self.text = text
    self.placeholder = placeholder
    self.config = config
  }

  public func _body(configuration: TextField<Self._Label>) -> some View {
    VStack {
      switch config.style {
      case .filled:
        configuration
          .padding(TextFieldConstants.textFieldPadding)
          .bold()
          .background(.gray.opacity(0.3))
          .clipShape(TextFieldConstants.unevenRoundedShape)
          .overlay(alignment: .bottom) {
            if isEditing {
              Divider().frame(height: 4).background(config.color)
            } else {
              Divider().frame(height: 2).background(config.color)
            }
          }
      case .outlined:
        configuration
          .padding(TextFieldConstants.textFieldPadding)
          .bold()
          .clipShape(TextFieldConstants.roundedShape)
          .overlay(TextFieldConstants.roundedShape.stroke(config.color,lineWidth: isEditing ? 2.0 : 1.0))
      case .standard:
        configuration
          .padding(TextFieldConstants.textFieldPadding)
          .bold()
          .overlay(alignment: .bottom) {
            if isEditing {
              Divider().frame(height: 4).background(config.color)
            } else {
              Divider().frame(height: 2).background(config.color)
            }
          }
      }
    }
    .onChange(of: text) { oldState, newState in
      withAnimation {
          isEditing = newState.count >= 1
      }
    }
  }
}

enum TextFieldConstants {
  static let textFieldPadding = EdgeInsets(top: 8,leading: 16,bottom: 8,trailing: 10)
  static let roundedShape = RoundedRectangle(cornerRadius: 5)
  static let corners = RectangleCornerRadii(topLeading: 5, bottomLeading: 0, bottomTrailing: 0, topTrailing: 5)
  static let unevenRoundedShape = UnevenRoundedRectangle(cornerRadii: corners)
}

let textFieldConfig1 = TUITextFieldConfig(color: .red, style: .outlined)
let textFieldConfig2 = TUITextFieldConfig(color: .green, style: .filled)

struct TextFieldPreview: View {
  @State var text = ""

    var body: some View {
      Group {
        TextField("Hello", text: $text)
          .textFieldStyle(TUITextFieldStyle(text: text, config: textFieldConfig1))
        TextField(text: $text, prompt: Text("nanana")) {
          Text("nanana")
        }
        .textFieldStyle(TUITextFieldStyle(text: text, config: textFieldConfig2))
        TextField(
          text: $text,
          label: {
            Label("Password", systemImage: "folder.circle")
          }
        )
        .textFieldStyle(TUITextFieldStyle(text: text))
      }.padding()
    }
}

#Preview {
  TextFieldPreview()
}

