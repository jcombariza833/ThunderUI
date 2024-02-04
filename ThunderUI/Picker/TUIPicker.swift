//
//  TUIPicker.swift
//  ThunderUI
//
//  Created by Juan Combariza on 12/29/23.
//

import SwiftUI

// MARK: - Congifuration
public enum PickerStyle {
  case standard
  case filled
  case outlined
}

public struct TUIPickerConfig: Equatable {
  public var color: Color
  public var style: TextFieldViewStyle

  public init(
    color: Color = .blue,
    style: TextFieldViewStyle = .standard
  ) {
    self.color = color
    self.style = style
  }
}

public struct TUIPicker<SelectionValue>: View where SelectionValue: Hashable {

  @Binding private var selectedOption: SelectionValue
  @State private var showSettings: Bool = false
  private var options: [SelectionValue]
  private var config: TUIPickerConfig
  private var formatter: (SelectionValue) -> String
  private var onStatusChange: ((Bool) -> Void)?

  var textFormat: String {
    formatter(selectedOption)
  }

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
    VStack {
      text
        .sheet(isPresented: $showSettings) {
          Picker("Options", selection: $selectedOption) {
            ForEach(options, id: \.self) { option in
              Text(formatter(option)).tag(option)
            }
          }
          .pickerStyle(WheelPickerStyle())
          .presentationDetents([.fraction(0.25)])
        }
    }
    .frame(maxWidth: .infinity)
    .gesture(
      TapGesture().onEnded { _ in
        showSettings.toggle()
      },
      including: .all
    )
  }

  var text: some View {
    ZStack {
      switch config.style {
      case .standard:
        Text(textFormat)
          .frame(maxWidth: .infinity)
          .padding(PickerConstants.pickerPadding)
          .bold()
          .overlay(alignment: .bottom) {
            Divider().frame(height: 4).background(config.color)
          }
      case .filled:
        Text(textFormat)
          .frame(maxWidth: .infinity)
          .padding(PickerConstants.pickerPadding)
          .bold()
          .background(.gray.opacity(0.3))
          .clipShape(PickerConstants.unevenRoundedShape)
          .overlay(alignment: .bottom) {
            Divider().frame(height: 4).background(config.color)
          }
      case .outlined:
        Text(textFormat)
          .frame(maxWidth: .infinity)
          .padding(PickerConstants.pickerPadding)
          .bold()
          .clipShape(PickerConstants.roundedShape)
          .overlay(PickerConstants.roundedShape.stroke(config.color, lineWidth: 2.0))
      }
    }
  }
}

enum PickerConstants {
  static let pickerPadding = EdgeInsets(top: 8,leading: 16,bottom: 8,trailing: 10)
  static let roundedShape = RoundedRectangle(cornerRadius: 5)
  static let corners = RectangleCornerRadii(topLeading: 5, bottomLeading: 0, bottomTrailing: 0, topTrailing: 5)
  static let unevenRoundedShape = UnevenRoundedRectangle(cornerRadii: corners)
}

struct TUIPickerPreview: View {
  @State var selectedOption: Int? = 1
  let options = [1, 2, 3, 4]

  var body: some View {
    VStack {
      Spacer()

      TUIPicker(
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
  TUIPickerPreview()
}
