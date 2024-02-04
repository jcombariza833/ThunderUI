//
//  TUIPicker.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/29/23.
//

import SwiftUI

public struct TUIColorPicker: View {
  @Binding private var selectedOption: Color
  @State private var showSettings: Bool = false
  private var placeholder: String?
  private var config: TUIPickerConfig
  private var onStatusChange: ((Bool) -> Void)?

  var textFormat: String {
    placeholder ?? ""
  }

  public init(
    placeholder: String? = nil,
    selectedOption: Binding<Color>,
    config: TUIPickerConfig = .init(),
    onStatusChange:  ((Bool) -> Void)? = nil
  ) {
    self.placeholder = placeholder
    self._selectedOption = selectedOption
    self.config = config
    self.onStatusChange = onStatusChange
  }

  public var body: some View {
    picker
  }

  var picker: some View {
    ZStack {
      switch config.style {
      case .standard:
        ColorPicker(textFormat, selection: $selectedOption)
          .frame(maxWidth: .infinity)
          .padding(PickerConstants.pickerPadding)
          .bold()
          .overlay(alignment: .bottom) {
            Divider().frame(height: 4).background(config.color)
          }
      case .filled:
        ColorPicker(textFormat, selection: $selectedOption)
          .frame(maxWidth: .infinity)
          .padding(PickerConstants.pickerPadding)
          .bold()
          .background(.gray.opacity(0.3))
          .clipShape(PickerConstants.unevenRoundedShape)
          .overlay(alignment: .bottom) {
            Divider().frame(height: 4).background(config.color)
          }
      case .outlined:
        ColorPicker(textFormat, selection: $selectedOption)
          .frame(maxWidth: .infinity)
          .padding(PickerConstants.pickerPadding)
          .bold()
          .clipShape(PickerConstants.roundedShape)
          .overlay(PickerConstants.roundedShape.stroke(config.color, lineWidth: 2.0))
      }
    }
  }
}


struct TUIColorPickerPreview: View {
  @State var selectedOption: Color = .red

  var body: some View {
    VStack {
      Spacer()
      TUIColorPicker(
        selectedOption: $selectedOption,
        config: .init(color: .black, style: .outlined)
      )
      Spacer()
      TUIColorPicker(
        selectedOption: $selectedOption,
        config: .init(color: .black, style: .filled)
      )
      Spacer()
      TUIColorPicker(
        selectedOption: $selectedOption,
        config: .init(color: .black, style: .standard)
      )
      Spacer()
    }
  }
}

#Preview {
  TUIColorPickerPreview()
}
