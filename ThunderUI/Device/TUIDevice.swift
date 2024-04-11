//
//  TUIDevice.swift
//  ThunderUI
//
//  Created by Juan Combariza on 4/1/24.
//

import SwiftUI
import Observation
import Combine

@Observable public class TUIDevice {
  public private(set) var orientation: UIDeviceOrientation = .unknown
  public private(set) var prevOrientation: UIDeviceOrientation = .unknown
  public private(set) var width: CGFloat = 0
  public private(set) var height: CGFloat = 0

  private var cancellables = Set<AnyCancellable>()

  public var isTallAspectRatio: Bool {
    let aspectRatio = height / width
    return aspectRatio > 1.8
  }

  public var shorterThaniPhoneX: Bool {
    height < 812
  }

  public var device: UIUserInterfaceIdiom {
    UIDevice.current.userInterfaceIdiom
  }

  public init() {
    listenForOrientationNotification()
    updateOrientation()
  }

  deinit {
    cancellables.removeAll()
  }

  private func listenForOrientationNotification() {
    NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
      .receive(on: DispatchQueue.main)
      .sink { [weak self] _ in
        guard let self = self else { return }
        self.updateOrientation()
      }
      .store(in: &cancellables)
  }

  private func updateOrientation() {
    prevOrientation = orientation
    orientation = UIDevice.current.orientation
    let wide = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
    let narrow = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
    if orientation.isLandscape {
      width = wide
      height = narrow
    } else {
      width = narrow
      height = wide
    }
  }
}

