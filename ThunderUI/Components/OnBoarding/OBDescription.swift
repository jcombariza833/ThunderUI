//
//  OBDescription.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/10/23.
//

import SwiftUI

struct OBDescription: View {
  let description: String
    var body: some View {
      Text(description)
        .bold()
        .font(.headline)
    }
}

#Preview {
  OBDescription(description:"Hello again, you've been missed")
    .foregroundStyle(.gray.opacity(0.8))
}
