//
//  TUIProgressView.swift
//  ThunderUI
//
//  Created by Juan Combariza on 2/4/24.
//

import SwiftUI

// MARK: - State
public struct ProgressState: Equatable {
  public enum Status {
    case loading, success, fail
  }

  let title: String?
  let systemImage: String?
  let status: Status

  public init(
    title: String? = nil,
    systemImage: String? = nil,
    status: Status
  ) {
    self.title = title
    self.systemImage = systemImage
    self.status = status
  }
}

// MARK: - View
public struct TUIProgressView: View {
  @Environment(\.colorScheme) var colorScheme
  @Binding private var state: ProgressState?

  public init(state: Binding<ProgressState?>) {
    self._state = state
  }

  var backgoundColor: Color {
    colorScheme == .dark ? .white : .black
  }

  public var body: some View {
    VStack {
      switch state?.status {
      case .loading:
        if let systemImage = state?.systemImage {
          VStack {
            Image(systemName: systemImage)
              .resizable()
              .frame(width: 25, height: 25)
              .foregroundStyle(backgoundColor.opacity(0.5))

            HStack(spacing:8) {
              Text(state?.title ?? "Loading").foregroundStyle(backgoundColor.opacity(0.5))
              ProgressView()
                .controlSize(.mini)
            }

          }
          .aspectRatio(1, contentMode: .fit)
          .transition(.scale)
        } else {
          ProgressView() {
            Text(state?.title ?? "Loading")
          }
          .controlSize(.extraLarge)
          .transition(.scale)
        }

      case .success:
        HStack {
          Image(systemName: state?.systemImage ?? "checkmark")
            .resizable()
            .frame(width: 25, height: 25)
            .foregroundStyle(.green)
            .bold()

          Text(state?.title ?? "Success!").foregroundStyle(backgoundColor.opacity(0.5))
        }
        .transition(.scale)

      case .fail:
        HStack {
          Image(systemName: state?.systemImage ?? "exclamationmark.triangle")
            .resizable()
            .frame(width: 25, height: 25)
            .foregroundStyle(.red)
            .bold()
          Text(state?.title ?? "Error has occurred").foregroundStyle(backgoundColor.opacity(0.5))
        }
        .transition(.scale)
      case .none:
        EmptyView()
          .transition(.scale)
      }
    }
    .padding(EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24))
    .background(
      RoundedRectangle(cornerRadius: 25.0)
        .fill(.ultraThickMaterial)
    )
//    .onChange(of: state, { oldValue, newValue in
//      switch state?.status {
//      case .success, .fail:
//        Task {
//          try await Task.sleep(nanoseconds: 2_000_000_000)
//          await MainActor.run {
//            state = nil
//          }
//        }
//      default:
//        return
//      }
//    })
    .animation(.default, value: state)
  }
}


struct PreviewProgressView: View {
  @State var progressState: ProgressState? = nil

    var body: some View {
      ZStack {
        VStack {
          Button("cambio") {
            Task {
              progressState = .init(status: .loading)
              try await Task.sleep(nanoseconds: 1_000_000_000)
              progressState = .init(status: .fail)
            }

          }
          .buttonStyle(.borderedProminent)
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(.white)
      .activityIndicator(state: $progressState)
    }
}

#Preview {
  PreviewProgressView()
}

