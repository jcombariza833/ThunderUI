//
//  Tab.swift
//  ThunderUI
//
//  Created by Juan Combariza on 3/13/24.
//

import Foundation
import SwiftUI

public protocol TabData {
  var title: String { get }
  var image: String { get }
}
public struct TabItemView<Content: View, Tab:  TabData & Hashable>: View {
  private let tab: Tab
  private let content: () -> Content

  public init(
    tab: Tab,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.tab = tab
    self.content = content
  }

  public var body: some View {
    content()
      .tabItem {
        Label(tab.title, systemImage: tab.image)
      }
      .tag(tab)
  }
}
