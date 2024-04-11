//
//  Environment+Device.swift
//  ThunderUI
//
//  Created by Juan Combariza on 4/2/24.
//

import Foundation
import SwiftUI
// MARK: - Navigation

private struct DeviceKey: EnvironmentKey {
  static let defaultValue: TUIDevice = .init()
}

public extension EnvironmentValues {
  var tuDevice: TUIDevice {
    get { self[DeviceKey.self] }
    set { self[DeviceKey.self] = newValue }
  }
}
