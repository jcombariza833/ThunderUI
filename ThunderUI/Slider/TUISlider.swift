//
//  TUISlider.swift
//  ThunderUI
//
//  Created by Juan Combariza on 1/2/24.
//

import SwiftUI

public enum SliderViewStyle {
  case normal
  case large
}

public struct TUISliderConfig: Equatable {
  var color: Color
  var trackColor: Color
  var style: SliderViewStyle

  public init(
    color: Color = .blue,
    trackColor: Color = .gray.opacity(0.25),
    style: SliderViewStyle = .normal
  ) {
    self.color = color
    self.trackColor = trackColor
    self.style = style
  }
}

public struct TUISlider<V,Label,ValueLabel>: View
where Label: View, ValueLabel: View, V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint {
  @Binding private var value: V
  private var bounds: ClosedRange<V>
  private var label: () -> Label
  private var minimumValueLabel: () -> ValueLabel
  private var maximumValueLabel: () -> ValueLabel
  private var onEditingChanged: (Bool) -> Void
  private var config: TUISliderConfig

  @State private var xPoint: Double = 0
  private let indicatorSize: CGFloat = 28
  private let barSize: CGFloat

  public var body: some View {
    VStack {
      label()
      HStack {
        minimumValueLabel()
        content
        maximumValueLabel()
      }
    }

    .frame(maxHeight: indicatorSize)
  }

  var content: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        RoundedRectangle(cornerRadius: 12)
          .foregroundColor(config.trackColor)
          .frame(height: barSize)
        RoundedRectangle(cornerRadius: 12)
          .foregroundColor(config.color)
          .frame(width: geometry.size.width * CGFloat(self.value / bounds.upperBound))
          .frame(height: barSize)

      }
      .frame(width: geometry.size.width, height: geometry.size.height)
      .overlay(alignment: .leading) {
        Circle()
          .fill(.white.shadow(.drop(color: .gray, radius: 2)))
          .frame(height: indicatorSize)
          .offset(x:xPoint, y:0)
      }
      .gesture(DragGesture(minimumDistance: 0)
        .onChanged { value in
          let currentValue = V(value.location.x / geometry.size.width) * bounds.upperBound
          self.value = min(max(bounds.lowerBound, currentValue), bounds.upperBound)
          onEditingChanged(true)
        }
        .onEnded{ value in
          onEditingChanged(false)
        }
      )
      .onAppear {
        xPoint = (geometry.size.width - indicatorSize) * Double(value)/Double(bounds.upperBound)
      }
      .onChange(of: value) { oldValue, newValue in
        xPoint = (geometry.size.width - indicatorSize) * Double(newValue)/Double(bounds.upperBound)
      }
    }
  }
}

extension TUISlider {
  public init(
    value: Binding<V>,
    in bounds: ClosedRange<V> = 0...1,
    config: TUISliderConfig = .init(),
    @ViewBuilder label: @escaping () -> Label,
    @ViewBuilder minimumValueLabel: @escaping () -> ValueLabel,
    @ViewBuilder maximumValueLabel: @escaping () -> ValueLabel,
    onEditingChanged: @escaping (Bool) -> Void = { _ in }
  ) {
    self._value = value
    self.bounds = bounds
    self.config = config
    self.label = label
    self.minimumValueLabel = minimumValueLabel
    self.maximumValueLabel = maximumValueLabel
    self.onEditingChanged = onEditingChanged
    self.barSize = config.style == .normal ? 4 : 14
  }
}

extension TUISlider where Label == EmptyView {
  public init(
    value: Binding<V>,
    in bounds: ClosedRange<V> = 0...1,
    config: TUISliderConfig = .init(),
    @ViewBuilder minimumValueLabel: @escaping () -> ValueLabel,
    @ViewBuilder maximumValueLabel: @escaping () -> ValueLabel,
    onEditingChanged: @escaping (Bool) -> Void = { _ in }
  ) {
    self._value = value
    self.bounds = bounds
    self.config = config
    self.label = { EmptyView() }
    self.minimumValueLabel = minimumValueLabel
    self.maximumValueLabel = maximumValueLabel
    self.onEditingChanged = onEditingChanged
    self.barSize = config.style == .normal ? 4 : 14
  }
}

extension TUISlider where ValueLabel == EmptyView {
  public init(
    value: Binding<V>,
    in bounds: ClosedRange<V> = 0...1,
    config: TUISliderConfig = .init(),
    @ViewBuilder label: @escaping () -> Label,
    onEditingChanged: @escaping (Bool) -> Void = { _ in }
  ) {
    self._value = value
    self.bounds = bounds
    self.config = config
    self.label = label
    self.minimumValueLabel = { EmptyView() }
    self.maximumValueLabel = { EmptyView() }
    self.onEditingChanged = onEditingChanged
    self.barSize = config.style == .normal ? 4 : 14
  }
}

extension TUISlider where ValueLabel == EmptyView, Label == EmptyView {
  public init(
    value: Binding<V>,
    in bounds: ClosedRange<V> = 0...1,
    config: TUISliderConfig = .init(),
    onEditingChanged: @escaping (Bool) -> Void = { _ in }
  ) {
    self._value = value
    self.bounds = bounds
    self.config = config
    self.label = { EmptyView() }
    self.minimumValueLabel = { EmptyView() }
    self.maximumValueLabel = { EmptyView() }
    self.onEditingChanged = onEditingChanged
    self.barSize = config.style == .normal ? 4 : 14
  }
}

struct TUISliderPreview: View {
  @State private var speed = 0.7
  var body: some View {
    VStack {
      TUISlider(
        value: $speed,
        in: 0...100,
        label: { Text("label") },
        minimumValueLabel: { Text("min") },
        maximumValueLabel: { Text("max") }
      )

      TUISlider(
        value: $speed,
        in: 0...100,
        config: .init(color: .red, style: .large),
        label: { Text("label") },
        minimumValueLabel: { Text("min") },
        maximumValueLabel: { Text("max") }
      )
      TUISlider(
        value: $speed,
        in: 0...100,
        minimumValueLabel: { Text("min") },
        maximumValueLabel: { Text("max") }
      )
      .padding()
    }

  }
}

#Preview {
  TUISliderPreview()
}
