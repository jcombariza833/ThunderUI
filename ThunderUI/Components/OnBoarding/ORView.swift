//
//  ORView.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/10/23.
//

import SwiftUI

struct ORView: View {
  var body: some View {
    HStack {
      VStack {
        Divider()
      }
      Text("OR")
        .bold()
        .foregroundStyle(.gray.opacity(0.8))
      VStack {
        Divider()
      }
    }
  }
}

#Preview {
    ORView()
}
