//
//  String+Extension.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/10/23.
//

import Foundation

extension String {
  public func isValidEmail() -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: self)
  }

  public func isValidPassword() -> Bool {
    let passwordRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\",.<>?]).{8,}$"

    let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
    return passwordPred.evaluate(with: self)
  }

  public func isValidUsername() -> Bool {
    let usernameRegEx = "^[a-zA-Z0-9]{3,20}$"

    let usernamePred = NSPredicate(format: "SELF MATCHES %@", usernameRegEx)
    return usernamePred.evaluate(with: self)
  }

  public var hasNonWhitespaceCharacters: Bool {
    !trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }

  public func trim() -> String {
    trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
  }
}
import SwiftUI

@propertyWrapper
public struct Email: DynamicProperty {

  @State private var value = ""

  public var wrappedValue: String {
    get { value }
    nonmutating set {
      if newValue.count < 5 {
        value = newValue
      }
    }
  }

  public var projectedValue: Binding<String> {
      Binding(
          get: { wrappedValue },
          set: { wrappedValue = $0 }
      )
  }

  public init(wrappedValue: String) {
    _value = State(wrappedValue: wrappedValue)
  }
}
