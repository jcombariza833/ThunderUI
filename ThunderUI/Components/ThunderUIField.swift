//
//  ThunderUIField.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/29/23.
//

import Foundation

public enum ThunderUIField<T>: Hashable where T: Hashable {
  case username
  case email
  case password
  case field(T)
}

enum Field: Hashable {
  case custom
}
