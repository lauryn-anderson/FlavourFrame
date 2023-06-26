//
//  RulerButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-26.
//

import SwiftUI

struct RulerButton: View {
    @Binding var isRulerActive: Bool
        
    var body: some View {
        Toggle(isOn: $isRulerActive) {
            Image(systemName: "ruler")
        }
        .toggleStyle(.button)
    }
}

struct RulerButton_Previews: PreviewProvider {
    @State static var active = true
    
    static var previews: some View {
        RulerButton(isRulerActive: $active)
    }
}
