//
//  SnackBarPopUp.swift
//  ThunderUI
//
//  Created by Juan Combariza on 2/10/24.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit


/// A view extension that displays a snackbar overlay using the provided model and visual scheme.
@available(iOS 17.0, *)
public extension View {
  /// Presents a snackbar when the `model` is non-nil, using a specified scheme for styling.
  ///
  /// - Parameters:
  ///   - model: A binding to an optional `SnackbarModel` that controls the snackbar's visibility and content.
  ///   - snackbarScheme: An optional scheme type used to style the snackbar. Defaults to `.default`.
  /// - Returns: A view with a snackbar overlay applied conditionally.
  func snackbar(model: Binding<SnackbarModel?>, snackbarScheme: SnackbarSchemeType = .default) -> some View {
    self._snackbar(model: model, snackbarScheme: snackbarScheme)
  }
}
