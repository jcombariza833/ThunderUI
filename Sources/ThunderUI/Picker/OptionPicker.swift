//
//  OptionPicker.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 4/21/25.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit

/// A view extension to present a custom picker interface for selecting an option.
@available(iOS 17.0, *)
public extension View {
  /// Presents an option picker when `isPresented` is `true`, and binds the selected option.
  ///
  /// - Parameters:
  ///   - isPresented: A binding to control the presentation of the picker.
  ///   - option: A binding to the currently selected option.
  /// - Returns: A view that displays an option picker overlay or modal.
  func optionPicker<Option: PickerOption>(
    isPresented: Binding<Bool>,
    option: Binding<Option?>
  ) -> some View {
    self._optionPicker(isPresented: isPresented, option: option)
  }
}
