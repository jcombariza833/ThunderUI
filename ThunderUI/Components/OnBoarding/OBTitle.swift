//
//  OBTitle.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/10/23.
//

import SwiftUI

public enum OBTitleContent {
    case string(String)
    case localizedKey(LocalizedStringKey)
}

public struct OBTitle: View {
  let titleContent: OBTitleContent

  public init(title: String) {
    self.titleContent = .string(title)
  }

  public init(key: LocalizedStringKey) {
    self.titleContent = .localizedKey(key)
  }

  public var body: some View {
    switch titleContent {
    case let .string(title):
      Text(title)
        .bold()
        .font(.largeTitle)
        .multilineTextAlignment(.leading)
    case let .localizedKey(titleKey):
      Text(titleKey)
        .bold()
        .font(.largeTitle)
        .multilineTextAlignment(.leading)
    }
  }
}

#Preview {
  OBTitle(title:"Welcome back!")
}
