//
//  ScaleToFit.swift
//  ThunderUI
//
//  Created by Juan Combariza on 4/11/24.
//

import Foundation
import SwiftUI

struct ScaleToFitModifier: ViewModifier {
  let contentSize: CGSize
  func body(content: Content) -> some View {
    GeometryReader { geometry in
      content
        .aspectRatio(contentSize, contentMode: .fit)
        .frame(width: geometry.size.width, height: geometry.size.height)
        .scaleEffect(scaleFactor(width: geometry.size.width, height: geometry.size.height))
    }
  }

  private func scaleFactor(width: CGFloat, height: CGFloat) -> CGFloat {
    let screenAspectRatio = width / height
    let contentAspectRatio = contentSize.width / contentSize.height
    return screenAspectRatio > contentAspectRatio ? height / contentSize.height : width / contentSize.width
  }
}

public extension View {
  func effectScaleToFit(_ originaSize: CGSize) -> some View {
    self.modifier(ScaleToFitModifier(contentSize: originaSize))
  }
}
