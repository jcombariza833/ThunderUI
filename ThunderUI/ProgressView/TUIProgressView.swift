//
//  TUIProgressView.swift
//  ThunderUI
//
//  Created by Juan Combariza on 2/4/24.
//

import SwiftUI

public typealias SystemImage = String?
public enum ProgressStatus: Equatable {
  case loading(SystemImage = nil)
  case success
  case fail
}

public struct TUIProgressView: View {
  @Environment(\.colorScheme) var colorScheme
  @Binding private var isPresented: Bool
  @Binding private var status: ProgressStatus

  public init(isPresented: Binding<Bool>, status: Binding<ProgressStatus>) {
    self._isPresented = isPresented
    self._status = status
  }

  var backgoundColor: Color {
    colorScheme == .dark ? .white : .black
  }

  public var body: some View {
    VStack {
      switch status {
      case .loading(let systemImage):
        if let systemImage {
          VStack {
            Image(systemName: systemImage)
              .resizable()
              .frame(width: 25, height: 25)
              .foregroundStyle(backgoundColor.opacity(0.5))

            HStack(spacing:8) {
              Text("Loading").foregroundStyle(backgoundColor.opacity(0.5))
              ProgressView()
                .controlSize(.mini)
            }

          }
          .aspectRatio(1, contentMode: .fit)
          .transition(.scale)
        } else {
          ProgressView() {
            Text("Loading")
          }
          .controlSize(.extraLarge)
          .transition(.scale)
        }

      case .success:
        HStack {
          Image(systemName: "checkmark")
            .resizable()
            .frame(width: 25, height: 25)
            .foregroundStyle(.green)
            .bold()

          Text("Success!").foregroundStyle(backgoundColor.opacity(0.5))
        }
        .transition(.scale)

      case .fail:
        HStack {
          Image(systemName: "exclamationmark.triangle")
            .resizable()
            .frame(width: 25, height: 25)
            .foregroundStyle(.red)
            .bold()
          Text("Error has occurred").foregroundStyle(backgoundColor.opacity(0.5))
        }
        .transition(.scale)
      }
    }
    .padding(EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24))
    .background(
      RoundedRectangle(cornerRadius: 25.0)
        .fill(.ultraThickMaterial)
    )
    .onChange(of: status, { oldValue, newValue in
      if newValue == .success ||  newValue == .fail {
        Task {
          try await Task.sleep(nanoseconds: 2_000_000_000)
          isPresented.toggle()
        }
      }
    })
    .animation(.default, value: status)
  }
}

public struct TUIProgressPopUp: ViewModifier {
  @Binding var isPresented: Bool
  @Binding var status: ProgressStatus

  public func body(content: Content) -> some View {
    ZStack {
      content
      if isPresented {
        ZStack {
          Color.gray.opacity(0.5)
            .clipShape(Rectangle())
          TUIProgressView(isPresented: $isPresented, status: $status)
        }
        .ignoresSafeArea()

      }
    }
    .animation(.default, value: isPresented)
  }
}

extension View {
  public func activityIndicator(isPresented: Binding<Bool>, status: Binding<ProgressStatus>) -> some View {
    self.modifier(TUIProgressPopUp(isPresented: isPresented, status: status))
  }
}

#Preview {
  TUIProgressView(isPresented: .constant(false), status: .constant(.loading()))
}

