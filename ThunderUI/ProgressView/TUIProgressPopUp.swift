//
//  TUIProgressPopUp.swift
//  ThunderUI
//
//  Created by Juan Combariza on 2/10/24.
//

import Foundation
import SwiftUI

public struct TUIProgressPopUp: ViewModifier {
  @Binding var state: ProgressState?

  public func body(content: Content) -> some View {
    ZStack {

      if state != nil  {
        content
        ZStack {
          Color.gray.opacity(0.5)
            .clipShape(Rectangle())
          TUIProgressView(state: $state)
        }
        .ignoresSafeArea()
        .transition(.opacity)
      } else {
        content
      }
    }
    .animation(.default, value: state)
    .onChange(of: state, { oldValue, newValue in
      switch state?.status {
      case .success, .fail:
        Task {
          try await Task.sleep(nanoseconds: 2_000_000_000)
          await MainActor.run {
            state = nil
          }
        }
      default:
        return
      }
    })

  }
}
