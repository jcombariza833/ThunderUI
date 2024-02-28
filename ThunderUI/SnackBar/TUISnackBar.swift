//
//  TUISnackBar.swift
//  ThunderUI
//
//  Created by Juan Combariza on 2/10/24.
//

import SwiftUI

// MARK: - Congifuration

public struct TUISnackBarConfig: Equatable {
  var foregroundColor: Color
  var backgroundColor: Color
  var resize: ResizeStyle

  public init(
    foregroundColor: Color = .white,
    backgroundColor: Color = .red,
    resize: ResizeStyle = .fit
  ) {
    self.foregroundColor = foregroundColor
    self.backgroundColor = backgroundColor
    self.resize = resize
  }
}

public struct SnackBarState: Equatable {
  var text: String
  var config: TUISnackBarConfig
  var buttonText: String?
  var aligment: Alignment
  var action: (() -> Void)?

  public init(
    text: String,
    config: TUISnackBarConfig,
    buttonText: String? = nil,
    aligment: Alignment = .center,
    action: (() -> Void)? = nil) {
      self.text = text
      self.config = config
      self.buttonText = buttonText
      self.aligment = aligment
      self.action = action
    }

  public static func == (lhs: SnackBarState, rhs: SnackBarState) -> Bool {
    return lhs.text == rhs.text &&
    lhs.config == rhs.config &&
    lhs.buttonText == rhs.buttonText
  }
}

struct TUISnackBar: View {
  var state: SnackBarState

  init(
    state: SnackBarState
  ) {
    self.state = state
  }

  var body: some View {
    HStack {
      Text(state.text)
        .frame(maxWidth: state.config.resize == .fill ? .infinity : nil, alignment: .leading)
      if let action = state.action, let buttonText = state.buttonText {
        Button {
          action()
        } label: {
          Text(buttonText.uppercased())
            .foregroundStyle(state.config.foregroundColor)
        }
      }
    }
    .padding(.all, 16)
    .background(state.config.backgroundColor)
    .foregroundStyle(state.config.foregroundColor)
    .clipShape(RoundedRectangle(cornerRadius: 5))
    .padding(.all, 16)
  }
}

struct PreviewSnackBrView: View {
  @State var showSnackBar: Bool = false
  @State var changeSize: Bool = false
  @State var state: SnackBarState? = nil

  var body: some View {
    ZStack {
      VStack {
        Text("Hello, World!")
          .onTapGesture {
            state = .init(
              text: "Impossible to export",
              config: .init(foregroundColor: .white, backgroundColor: .black, resize: .fill),
              buttonText: "Undo",
              aligment: .bottom, 
              action: {
                //
              }
            )
          }
        Button("cambio") {
          changeSize.toggle()
          state = .init(
            text: "Impossible to export",
            config: .init(foregroundColor: .white, backgroundColor: .red, resize: .fit),
            buttonText: "Undo",
            aligment: .bottom
          )
        }
        .buttonStyle(.borderedProminent)
        .controlSize( changeSize ? .large : .small)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.white)
    .snackBarPopUp(state: $state)
  }
}

#Preview {
  PreviewSnackBrView()
}
