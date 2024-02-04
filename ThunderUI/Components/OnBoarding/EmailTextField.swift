//
//  EmailTextField.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/10/23.
//

import SwiftUI

public struct EmailTextField<T>: View where T: Hashable {
  @Binding private var email: String
  @State private var config: TextFieldState
  private var focusedField: FocusState<ThunderUIField<T>?>.Binding
  private let scheme: ColorScheme
  private var onStatusChange: ((TextFieldState) -> Void)?

  private var isDark: Bool {
    scheme == .dark
  }

  public init(
    email: Binding<String>,
    scheme: ColorScheme = .light,
    focusedField: FocusState<ThunderUIField<T>?>.Binding,
    onStatusChange:  ((TextFieldState) -> Void)? = nil
  ) {
    self.scheme = scheme
    self._email = email
    let isDark = scheme == .dark
    self._config = State(initialValue: isDark ? .normalDark : .normalLight)
    self.focusedField = focusedField
    self.onStatusChange = onStatusChange
  }

  public var body: some View {
    TUITextFieldContainer(
      text: email,
      config: config.rawValue,
      left: {
        Image(systemName: "envelope")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .font(Font.title.weight(.black))
          .frame(width: 16, height: 16, alignment: .center)
          .foregroundColor(config.rawValue.color)
      },
      content: {
        TextField("email", text: $email)
          .keyboardType(.emailAddress)
          .focused(focusedField, equals: .email)
      },
      right: {
        Image(systemName: "xmark")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .font(Font.title.weight(.black))
          .frame(width: 16, height: 16, alignment: .center)
          .foregroundColor(config.rawValue.color)
          .onTapGesture {
            email = ""
          }
      }
    )
    .onChange(of: email) { oldValue, newValue in
      if newValue.isEmpty {
        config = isDark ? .normalDark : .normalLight
      } else if newValue.isValidEmail() {
        config = .success
      } else {
        config = .error
      }
      onStatusChange?(config)
    }
    .onAppear {
      config = isDark ? .normalDark : .normalLight
    }
  }
}

struct EmailTextFieldPreview: View {
  @State var email = ""
  @FocusState var focused: ThunderUIField<Field>?

  var body: some View {
    UsernameTextField(username: $email, focusedField: $focused)
  }
}

#Preview {
  EmailTextFieldPreview()
}
