//
//  KeyboardDismisser.swift
//  ThunderUI
//
//  Created by Juan Combariza on 1/20/24.
//

import Foundation
import SwiftUI

struct KeyboardDismisser: ViewModifier {
  var isFocused: FocusState<Bool>.Binding

  func body(content: Content) -> some View {
    content
      .background {
        DismissKeyboardView(isFocused: isFocused)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
  }
}

struct DismissKeyboardView: View {
  var isFocused: FocusState<Bool>.Binding

  var body: some View {
    Color.clear
      .contentShape(Rectangle())
      .gesture(TapGesture().onEnded({ _ in
        isFocused.wrappedValue = false
      }),including: .all)
      .edgesIgnoringSafeArea(.all)
  }
}

public extension View {
  func focusDismiss(_ isFocused: FocusState<Bool>.Binding) -> some View {
    modifier(KeyboardDismisser(isFocused: isFocused))
  }
}

// MARK: - Hashable
struct GenericKeyboardDismisser<FocusedValue: Hashable>: ViewModifier {  // Make it generic
  var isFocused: FocusState<FocusedValue?>.Binding

  func body(content: Content) -> some View {
    content
      .background {
        GenericDismissKeyboardView(isFocused: isFocused)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
  }
}

struct GenericDismissKeyboardView<FocusedValue: Hashable>: View {  // Make it generic
  var isFocused: FocusState<FocusedValue?>.Binding
  
  var body: some View {
    Color.clear
      .contentShape(Rectangle())
      .gesture(TapGesture().onEnded({ _ in
        isFocused.wrappedValue = nil
      }), including: .all)
      .edgesIgnoringSafeArea(.all)
  }
}

public extension View {
  func multipleFocusDismiss<FocusedValue: Hashable>(_ isFocused: FocusState<FocusedValue?>.Binding) -> some View {
    modifier(GenericKeyboardDismisser(isFocused: isFocused))
  }
}
