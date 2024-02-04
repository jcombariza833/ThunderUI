//
//  PreferenceKey+Size.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/7/23.
//

import SwiftUI

// MARK: - SizeKey

private struct SizeKey: PreferenceKey {
  static let defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
    value = nextValue()
  }
}

extension View {
  public func captureSize(in binding: Binding<CGSize>) -> some View {
    overlay(GeometryReader { proxy in
      Color.clear.preference(key: SizeKey.self, value: proxy.size)
    })
    .onPreferenceChange(SizeKey.self) { size in binding.wrappedValue = size }
  }
}
