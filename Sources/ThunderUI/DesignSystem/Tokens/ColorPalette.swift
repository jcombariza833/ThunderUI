//
//  Color.swift
//  ThunderUIKit
//
//  Created by Juan Combariza on 3/15/25.
//

import Foundation
import SwiftUI
@_exported import ThunderUIKit

/// Represents a set of color shades, typically from light (`s50`) to dark (`s900`), following a 10-step scale.
public typealias ColorShades = ThunderUIKit.ColorShades

/// Defines the brand color scheme, including primary, secondary, and optional accent colors.
public typealias BrandColor = ThunderUIKit.BrandColor

/// Defines colors used for functional feedback such as errors, warnings, successes, and informational messages.
public typealias FunctionalColor = ThunderUIKit.FunctionalColor

/// Defines neutral UI colors used for surfaces, backgrounds, borders, and shadows.
public typealias NeutralColor = ThunderUIKit.NeutralColor

/// A unified color palette combining brand, functional, and neutral color sets.
public typealias ColorPalette = ThunderUIKit.ColorPalette
