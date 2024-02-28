//
//  View+Extension.swift
//  ThunderUI
//
//  Created by Juan Combariza on 2/10/24.
//

import Foundation
import SwiftUI

extension View {
  public func snackBarPopUp(state: Binding<SnackBarState?>) -> some View {
    self.modifier(SnackBarPopUp(state: state))
  }
}
