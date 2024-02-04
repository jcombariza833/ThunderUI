//
//  UsernameTextField.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/11/23.
//

import SwiftUI

public struct UsernameTextField<T>: View where T: Hashable {

  @Binding private var username: String
  @State private var config: TextFieldState
  private var focusedField: FocusState<ThunderUIField<T>?>.Binding
  private let scheme: ColorScheme
  private var onStatusChange: ((TextFieldState) -> Void)?

  private var isDark: Bool {
    scheme == .dark
  }

  public init(
    username: Binding<String>,
    scheme: ColorScheme = .light,
    focusedField: FocusState<ThunderUIField<T>?>.Binding,
    onStatusChange:  ((TextFieldState) -> Void)? = nil
  ) {
    self.scheme = scheme
    self._username = username
    let isDark = scheme == .dark
    self._config = State(initialValue: isDark ? .normalDark : .normalLight)
    self.focusedField = focusedField
    self.onStatusChange = onStatusChange
  }

  public var body: some View {
    TUITextFieldContainer(
      text: username,
      config: config.rawValue,
      left: {
        Image(systemName: "person.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .font(Font.title.weight(.black))
          .frame(width: 16, height: 16, alignment: .center)
          .foregroundColor(config.rawValue.color)
      },
      content: {
        TextField("username", text: $username)
          .keyboardType(.emailAddress)
          .focused(focusedField, equals: .username)
      },
      right: {
        Image(systemName: "xmark")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .font(Font.title.weight(.black))
          .frame(width: 16, height: 16, alignment: .center)
          .foregroundColor(config.rawValue.color)
          .onTapGesture {
            username = ""
          }
      }
    )
    .onChange(of: username) { oldValue, newValue in
      if newValue.isEmpty {
        config = isDark ? .normalDark : .normalLight
      } else if newValue.isValidUsername() {
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



struct UsernameTextFieldPreview: View {
  @State var username = ""
  @FocusState var focused: ThunderUIField<Field>?

  var body: some View {
    UsernameTextField(username: $username, focusedField: $focused)
  }
}

#Preview {
  UsernameTextFieldPreview()
}
