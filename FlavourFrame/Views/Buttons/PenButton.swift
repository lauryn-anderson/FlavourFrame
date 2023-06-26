//
//  PenButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-26.
//

import SwiftUI
import PencilKit

struct PenButton: View {
    @Binding var isErasing: Bool
    
    var body: some View {
        // binding inverts boolean values
        Toggle(isOn: Binding<Bool>(
            get: { !isErasing },
            set: { isErasing = !$0 }
        )) {
            Image(systemName: "pencil")
        }
        .toggleStyle(.button)
    }
}
