//
//  EraserButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-26.
//

import SwiftUI
import PencilKit

struct EraserButton: View {
    @Binding var isErasing: Bool
    
    var body: some View {
        Toggle(isOn: $isErasing) {
            Image(systemName: "eraser")
        }
        .toggleStyle(.button)
    }
}
