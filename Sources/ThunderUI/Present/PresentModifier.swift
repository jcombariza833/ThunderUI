//
//  PresentModifier.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 3/9/25.
//

import SwiftUI
@_exported import ThunderUIKit

/// A view extension for presenting custom modal-like content with transition and dismissal control.
@available(iOS 17.0, *)
public extension View {
  /// Presents a custom view overlay conditionally, with a specified transition and optional dismissal handler.
  ///
  /// - Parameters:
  ///   - isPresented: A binding that controls whether the content is presented.
  ///   - transition: The transition animation to use when showing or hiding the content. Defaults to `.opacity`.
  ///   - onDismiss: An optional closure called when the content is dismissed.
  ///   - content: A view builder that constructs the content to present.
  /// - Returns: A view with a conditional presentation layer.
  func present<PresentContent: View>(
    isPresented: Binding<Bool>,
    transition: AnyTransition = .opacity,
    onDismiss: (() -> Void)? = nil,
    @ViewBuilder content: @escaping () -> PresentContent
  ) -> some View {
    self._present(
      isPresented: isPresented,
      transition: transition,
      onDismiss: onDismiss,
      content: content
    )
  }
}
