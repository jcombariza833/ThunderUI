//
//  Color+Extension.swift
//  ThunderUI
//
//  Created by Juan Combariza on 2/3/24.
//

import Foundation
import SwiftUI

public extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }

    var hexString: String {
        let components = self.components()
        let red = Int(components.red * 255)
        let green = Int(components.green * 255)
        let blue = Int(components.blue * 255)

        return String(format: "#%02X%02X%02X", red, green, blue)
    }

    private func components() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        guard let components = UIColor(self).cgColor.components else {
            fatalError("Invalid color format")
        }

        return (
            red: components[0],
            green: components[1],
            blue: components[2],
            alpha: components[3]
        )
    }
}
