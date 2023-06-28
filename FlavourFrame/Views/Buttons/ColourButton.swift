//
//  ColourButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-26.
//

import SwiftUI

struct ColourButton: View {
    @Binding var inkColor: UIColor
    
    var body: some View {
        // binding converts between Color and UIColor
        ColorPicker(selection: Binding<Color>(
            get: { Color(uiColor: inkColor) },
            set: { inkColor = UIColor($0) }
        )) {}
    }
}

struct ColourButton_Previews: PreviewProvider {
    static var previews: some View {
        ColourButton(inkColor: .constant(.black))
    }
}
