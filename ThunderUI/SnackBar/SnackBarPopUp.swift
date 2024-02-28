//
//  SnackBarPopUp.swift
//  ThunderUI
//
//  Created by Juan Combariza on 2/10/24.
//

import Foundation
import SwiftUI
import Observation

public struct SnackBarPopUp: ViewModifier {
  @Binding var state: SnackBarState?

  public func body(content: Content) -> some View {
    ZStack(alignment: state?.aligment ?? .center) {
      if let state {
        content
        TUISnackBar(state: state)
          .transition(.opacity)
      } else {
        content
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .onChange(of: state, { oldValue, newValue in
      if newValue != nil, oldValue == nil {
        displaySnackBar()
      }
    })
    .animation(.default, value: state)
  }

  func displaySnackBar() {
    Task {
      try await Task.sleep(nanoseconds: 4_000_000_000)
      await MainActor.run {
        state = nil
      }
    }

  }
}
