//
//  TUIToggle.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/6/23.
//

import SwiftUI
@_exported import ThunderUIKit

/// A marker protocol for toggle components in the design system.
/// Conforming types must be SwiftUI views and are styled via `ToggleScheme`.
public typealias TUIToggle = ThunderUIKit.TUIToggle

/// A customizable toggle component styled via the design system's `ToggleScheme`.
/// Supports a title label, state binding, and environment-driven styling (resizing and enablement).
public typealias TUIToggleView = ThunderUIKit.TUIToggleView
