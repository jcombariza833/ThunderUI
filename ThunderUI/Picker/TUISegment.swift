//
//  TUISegment.swift
//  ThunderUI
//
//  Created by Juan Combariza on 1/17/24.
//

import SwiftUI

public struct TUISegment<SelectionValue>: View where SelectionValue: Hashable {

  @Binding private var selectedOption: SelectionValue
  private var options: [SelectionValue]
  private var config: TUIPickerConfig
  private var formatter: (SelectionValue) -> String
  private var onStatusChange: ((Bool) -> Void)?

  public init(
    selectedOption: Binding<SelectionValue>,
    options: [SelectionValue] = [],
    config: TUIPickerConfig = .init(),
    formatter: @escaping (SelectionValue) -> String,
    onStatusChange:  ((Bool) -> Void)? = nil
  ) {
    self._selectedOption = selectedOption
    self.options = options
    self.config = config
    self.formatter = formatter
    self.onStatusChange = onStatusChange
  }

  public var body: some View {
    segment
  }

  var picker: some View {
    Picker("", selection: $selectedOption) {
      ForEach(options, id: \.self) { option in
        Text(formatter(option)).tag(option)
      }
    }
    .pickerStyle(SegmentedPickerStyle())
  }

  var segment: some View {
    ZStack {
      switch config.style {
      case .standard:
        picker
          .frame(maxWidth: .infinity)
          .padding(PickerConstants.pickerPadding)
          .bold()
          .overlay(alignment: .bottom) {
            Divider().frame(height: 2).background(config.color)
          }
      case .filled:
        picker
          .frame(maxWidth: .infinity)
          .padding(PickerConstants.pickerPadding)
          .bold()
          .background(.gray.opacity(0.3))
          .clipShape(PickerConstants.unevenRoundedShape)
          .overlay(alignment: .bottom) {
            Divider().frame(height: 2).background(config.color)
          }
      case .outlined:
        picker
          .frame(maxWidth: .infinity)
          .padding(PickerConstants.pickerPadding)
          .bold()
          .clipShape(PickerConstants.roundedShape)
          .overlay(PickerConstants.roundedShape.stroke(config.color, lineWidth: 1.0))
      }
    }
  }
}


struct TUISegmentPreview: View {
  @State var selectedOption: Int? = 1
  let options = [1, 2, 3, 4]

  var body: some View {
    VStack {
      Spacer()
      TUISegment(
        selectedOption: $selectedOption,
        options: options,
        config: .init(color: .black, style: .outlined),
        formatter: { "\(String(describing: $0)) Hours" }
      )
      Spacer()
      TUIPicker(
        selectedOption: $selectedOption,
        options: options,
        config: .init(color: .black, style: .filled),
        formatter: { "\(String(describing: $0)) Hours" }
      )
      Spacer()
      TUIPicker(
        selectedOption: $selectedOption,
        options: options,
        config: .init(color: .black, style: .standard),
        formatter: { "\(String(describing: $0)) Hours" }
      )
      Spacer()
    }
  }
}

#Preview {
  TUISegmentPreview()
}

