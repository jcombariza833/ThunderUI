//
//  View+Extension.swift
//  ThunderUI
//
//  Created by Juan Combariza on 2/10/24.
//

import Foundation
import SwiftUI

extension View {
  public func activityIndicator(state: Binding<ProgressState?>) -> some View {
    self.modifier(TUIProgressPopUp(state: state))
  }
}
