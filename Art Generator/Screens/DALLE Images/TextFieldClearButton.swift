//
//  TextFieldClearButton.swift
//  Art Generator
//
//  Created by Alex Bussan on 8/31/23.
//

import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var fieldText: String
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .topTrailing) {
                if !fieldText.isEmpty {
                    HStack {
                        Spacer()
                        Button {
                            fieldText = ""
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                        }
                        .foregroundColor(.secondary)
                        .padding(.trailing, 4)
                    }
                    .offset(x: 12, y: -8)
                }
            }
    }
}

extension View {
    func showClearButton(_ text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(fieldText: text))
    }
}
