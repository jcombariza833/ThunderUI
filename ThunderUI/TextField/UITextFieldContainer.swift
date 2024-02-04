//
//  UITextFieldContainer.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/7/23.
//

import Foundation
import SwiftUI

public struct TUITextFieldContainer<Left: View, Content: View, Right: View>: View where Content: View {
  var text: String
  var config: TUITextFieldConfig
  var placeholder: String?

  let left: () -> Left
  var content: () -> Content
  let right: () -> Right

  @State private var isEditing = false
  @State private var placeholderRect: CGRect = .zero
  @State private var containerRect: CGRect = .zero
  @State private var leftElementRect: CGRect = .zero
  @State private var texto = ""

  public init(
    text: String,
    placeholder: String? = nil,
    config: TUITextFieldConfig = .init(),
    @ViewBuilder left: @escaping () -> Left,
    @ViewBuilder content: @escaping () -> Content,
    @ViewBuilder right: @escaping () -> Right
  ) {
    self.text = text
    self.placeholder = placeholder
    self.config = config
    self.left = left
    self.content = content
    self.right = right
  }

  public var body: some View {
    ZStack(alignment:.leading) {
      if let placeholder = placeholder {
        Text(placeholder)
          .bold()
          .textCase(.uppercase)
          .foregroundColor(isEditing ? config.color : .gray.opacity(0.8))
          .scaleEffect(isEditing ? 0.5 : 1, anchor: .topLeading)
          .position(
            x: isEditing ? xposEditing : xpos,
            y: isEditing ? yposEditing : ypos
          )
          .frame(width: placeholderRect.width, height: placeholderRect.height)



      }
      switch config.style {
      case .filled:
        textField
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
        textField
          .padding(TextFieldConstants.textFieldPadding)
          .bold()
          .clipShape(TextFieldConstants.roundedShape)
          .overlay(TextFieldConstants.roundedShape.stroke(config.color,lineWidth: isEditing ? 2.0 : 1.0))
      case .standard:
        textField
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
    .capturePosition(in: $containerRect,in: .global)
  }

  var textField: some View {
    HStack{
      left()
        .capturePosition(in: $leftElementRect,in: .global)
      content()
        .capturePosition(in: $placeholderRect,in: .global)
      right()
    }
    .foregroundColor(config.color)
    .coordinateSpace(name: "placeholderContainer")
  }

  private var xpos: CGFloat {
    placeholderRect.origin.x - containerRect.origin.x + 16 + 9.5
  }
  private var ypos: CGFloat {
    placeholderRect.origin.y - containerRect.origin.y + 3
  }

  private var xposEditing: CGFloat {
    placeholderRect.origin.x - containerRect.origin.x - leftElementRect.width + 10
  }
  private var yposEditing: CGFloat {
    -10
  }
}

extension TUITextFieldContainer where Right == EmptyView {
  public init(
    text: String,
    placeholder: String? = nil,
    config: TUITextFieldConfig = .init(),
    @ViewBuilder left: @escaping () -> Left,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.text = text
    self.placeholder = placeholder
    self.config = config
    self.left = left
    self.content = content
    self.right = { EmptyView() }
  }
}

extension TUITextFieldContainer where Left == EmptyView {
  public init(
    text: String,
    placeholder: String? = nil,
    config: TUITextFieldConfig = .init(),
    @ViewBuilder content: @escaping () -> Content,
    @ViewBuilder right: @escaping () -> Right
  ) {
    self.text = text
    self.placeholder = placeholder
    self.config = config
    self.left = { EmptyView() }
    self.content = content
    self.right = right
  }
}

extension TUITextFieldContainer where Left == EmptyView, Right == EmptyView {
  public init(
    text: String,
    placeholder: String? = nil,
    config: TUITextFieldConfig = .init(),
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.text = text
    self.placeholder = placeholder
    self.config = config
    self.left = { EmptyView() }
    self.content = content
    self.right = { EmptyView() }
  }
}

let textFieldContainerConfig1 = TUITextFieldConfig(color: .red, style: .outlined)
let textFieldContainerConfig2 = TUITextFieldConfig(color: .blue, style: .standard)
let textFieldContainerConfig3 = TUITextFieldConfig(color: .green, style: .filled)

struct TextFieldContainerPreview: View {
  @State var text = ""

    var body: some View {
      VStack {
     // placeholder: "email"
        TUITextFieldContainer(text: text) {
          TextField("Email", text: $text)
        }
        .padding()
        
        TUITextFieldContainer(text: text, placeholder: "Email", config: textFieldContainerConfig1) {
          TextField("", text: $text)
        }
        .padding()

        TUITextFieldContainer(text: text, config: textFieldContainerConfig2) {
          TextField("Email", text: $text)
        }
        .padding()

        TUITextFieldContainer(
          text: text,
          config: textFieldContainerConfig3,
          left: {
            Image(systemName: "envelope")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .font(Font.title.weight(.black))
              .frame(width: 16, height: 16, alignment: .center)
              .foregroundColor(.blue)
          },
          content: { TextField("Email", text: $text) },
          right: {
            Image(systemName: "xmark")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .font(Font.title.weight(.black))
              .frame(width: 16, height: 16, alignment: .center)
              .foregroundColor(.red)
              .onTapGesture {
                text = ""
              }
          }
        )
        .padding()

      }
      .padding()
    }
}

#Preview {
  TextFieldContainerPreview()
}
