//
//  PreferenceKey+Position.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/7/23.
//

import SwiftUI
import Foundation
// MARK: - PositioneKey

private struct PositionKey: PreferenceKey {
  static let defaultValue: CGRect = .zero
  static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
    value = nextValue()
  }
}

extension View {
  public func capturePosition(in binding: Binding<CGRect>,in coordinateSpace: some CoordinateSpaceProtocol) -> some View {
    overlay(GeometryReader { proxy in
      Color.clear.preference(key: PositionKey.self, value: proxy.frame(in: coordinateSpace))
    })
    .onPreferenceChange(PositionKey.self) { rect in binding.wrappedValue = rect }
  }
}
