//
//  LoginView.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/7/23.
//

import SwiftUI

public struct TUILoginView: View {
  @Binding var email: String
  @Binding var password: String

  let onLogin: () -> Void
  let onForgotPassword: () -> Void
  let onAppleLogin: () -> Void
  let onGoogleLogin: () -> Void
  let onRegister: () -> Void

  let loginButtonConfig = ButtonDesign.black.rawValue
  let appleButtonConfig = ButtonDesign.black.rawValue
  let googleButtonConfig = ButtonDesign.redBorder.rawValue

  @FocusState private var focusedField: ThunderUIField<Field>?

  public init(
    email: Binding<String>,
    password: Binding<String>,
    onLogin: @escaping () -> Void,
    onForgotPassword: @escaping () -> Void,
    onAppleLogin: @escaping () -> Void,
    onGoogleLogin: @escaping () -> Void,
    onRegister: @escaping () -> Void
  ) {
    self._email = email
    self._password = password
    self.onLogin = onLogin
    self.onForgotPassword = onForgotPassword
    self.onAppleLogin = onAppleLogin
    self.onGoogleLogin = onGoogleLogin
    self.onRegister = onRegister
  }

  public var body: some View {
    VStack {
      Spacer()
      VStack(alignment: .leading) {
        OBTitle(title:"Create")
        OBTitle(title:"Account")
        Spacer().frame(height: 8)
        OBDescription(description:"Hello again, you've been missed")
          .foregroundStyle(.gray.opacity(0.8))
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      Spacer()
      EmailTextField(email: $email, focusedField: $focusedField)
      Spacer().frame(height: 16)
      PasswordTextField(password: $password, focusedField: $focusedField)

      HStack {
        Spacer()
        TUILink("Forgot password") {
          onForgotPassword()
        }
      }
      Spacer()
      VStack {
        Button("Login") {
          onLogin()
        }
        .buttonStyle(TUIButtonStyle(config: loginButtonConfig))
        Spacer().frame(height: 48)
        ORView()
      }

      HStack {
        Button("apple",systemImage: "apple.logo") {
          onAppleLogin()
        }
        .buttonStyle(TUIButtonStyle(config: appleButtonConfig))
        Button("google",systemImage: "g.circle.fill") {
          onGoogleLogin()
        }
        .buttonStyle(TUIButtonStyle(config: googleButtonConfig))
      }
      Spacer()
      HStack {
        Text("Don't have an account?")
          .foregroundStyle(.gray.opacity(0.8))
        TUILink("Register") {
          onRegister()
        }
      }
    }
    .padding()
  }
}

struct LoginViewPreview: View {
  @State var email = ""
  @State var password = ""
  var body: some View {
    TUILoginView(
      email: $email,
      password: $password,
      onLogin: {

      },
      onForgotPassword: {

      }, 
      onAppleLogin: {

      }, 
      onGoogleLogin: {

      }, 
      onRegister: {

      }
    )
  }
}

#Preview {
  LoginViewPreview()
}
