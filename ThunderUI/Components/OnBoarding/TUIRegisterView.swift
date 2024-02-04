//
//  RegisterView.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/7/23.
//

import SwiftUI

public struct TUIRegisterView: View {
  @Binding var username: String
  @Binding var email: String
  @Binding var password: String

  let onRegister: () -> Void
  let onAppleRegister: () -> Void
  let onGoogleRegister: () -> Void
  let onLogin: () -> Void

  let loginButtonConfig = ButtonDesign.black.rawValue
  let appleButtonConfig = ButtonDesign.black.rawValue
  let googleButtonConfig = ButtonDesign.redBorder.rawValue

  @FocusState private var focusedField: ThunderUIField<Field>?

  public init(
    username: Binding<String>,
    email: Binding<String>,
    password: Binding<String>,
    onRegister: @escaping () -> Void,
    onAppleRegister: @escaping () -> Void,
    onGoogleRegister: @escaping () -> Void,
    onLogin: @escaping () -> Void
  ) {
    self._username = username
    self._email = email
    self._password = password
    self.onRegister = onRegister
    self.onAppleRegister = onAppleRegister
    self.onGoogleRegister = onGoogleRegister
    self.onLogin = onLogin
  }

  public var body: some View {
    VStack {
      Spacer()
      VStack(alignment: .leading) {
        OBTitle(title:"Create")
        OBTitle(title:"Account")
        Spacer().frame(height: 8)
        OBDescription(description:"We are glad to see you here")
          .foregroundStyle(.gray.opacity(0.8))
      }
      .frame(maxWidth: .infinity, alignment: .leading)

      Spacer()
      UsernameTextField(username: $username, focusedField: $focusedField)
      Spacer().frame(height: 16)
      EmailTextField(email: $email, focusedField: $focusedField)
      Spacer().frame(height: 16)
      PasswordTextField(password: $password, focusedField: $focusedField)

      Spacer()
      VStack {
        Button("Register") {
          onRegister()
        }
        .buttonStyle(TUIButtonStyle(config: loginButtonConfig))
        Spacer().frame(height: 48)
        ORView()
      }

      HStack {
        Button("apple",systemImage: "apple.logo") {
          onAppleRegister()
        }
        .buttonStyle(TUIButtonStyle(config: appleButtonConfig))
        Button("google",systemImage: "g.circle.fill") {
          onGoogleRegister()
        }
        .buttonStyle(TUIButtonStyle(config: googleButtonConfig))
      }
      Spacer()
      HStack {
        Text("Already have an account?")
          .foregroundStyle(.gray.opacity(0.8))
        TUILink("Login") {
          onLogin()
        }
      }
    }
    .padding()
  }
}

struct RegisterViewPreview: View {
  @State var username = ""
  @State var email = ""
  @State var password = ""

  var body: some View {
    TUIRegisterView(
      username: $username,
      email: $email, 
      password: $password, 
      onRegister: { },
      onAppleRegister: { },
      onGoogleRegister: { },
      onLogin: { }
    )
  }
}

#Preview {
  RegisterViewPreview()
}
