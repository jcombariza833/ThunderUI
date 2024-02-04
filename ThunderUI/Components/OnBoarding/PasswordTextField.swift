//
//  PasswordTextField.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/10/23.
//

import SwiftUI

public struct PasswordTextField<T>: View where T: Hashable {
  @Binding private var password: String
  @State private var config: TextFieldState
  @State private var showPassword = false
  private var focusedField: FocusState<ThunderUIField<T>?>.Binding
  private let scheme: ColorScheme
  private var onStatusChange: ((TextFieldState) -> Void)?

  private var isDark: Bool {
    scheme == .dark
  }

  public init(
    password: Binding<String>,
    scheme: ColorScheme = .light,
    focusedField: FocusState<ThunderUIField<T>?>.Binding,
    onStatusChange:  ((TextFieldState) -> Void)? = nil
  ) {
    self.scheme = scheme
    self._password = password
    let isDark = scheme == .dark
    self._config = State(initialValue: isDark ? .normalDark : .normalLight)
    self.focusedField = focusedField
    self.onStatusChange = onStatusChange
  }

  public var body: some View {
    TUITextFieldContainer(
      text: password,
      config: config.rawValue,
      left: {
        Image(systemName: "lock")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .font(Font.title.weight(.black))
          .frame(width: 16, height: 16, alignment: .center)
          .foregroundColor(config.rawValue.color)
      },
      content: {
        HStack {
          if showPassword {
            TextField("password", text: $password)
              .focused(focusedField, equals: .password)
          } else {
            SecureField("password", text: $password)
              .focused(focusedField, equals: .password)
          }
        }
      },
      right: {
        Image(systemName: showPassword ? "eye" : "eye.slash")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .font(Font.title.weight(.black))
          .frame(width: 16, height: 16, alignment: .center)
          .foregroundColor(config.rawValue.color)
          .onTapGesture {
            showPassword.toggle()
          }
      }
    )
    .onChange(of: password) { oldValue, newValue in
      if newValue.isEmpty {
        config = isDark ? .normalDark : .normalLight
      } else if newValue.isValidPassword() {
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

struct PasswordTextFieldPreview: View {
  @State var password = ""
  @FocusState var focused: ThunderUIField<Field>?

  var body: some View {
    UsernameTextField(username: $password, focusedField: $focused)
  }
}

#Preview {
  PasswordTextFieldPreview()
}
