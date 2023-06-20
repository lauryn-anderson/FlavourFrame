//
//  AddButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-12.
//

import SwiftUI

struct AddButton: View {
    @Binding var flavours: [Flavour]
    @Binding var isPresentingNewFlavourView: Bool
    let thumbnailSize = CGSize(width: 150, height: 150)

    var body: some View {
        Button(action: {
            isPresentingNewFlavourView = true
        }) {
            Text("+ New Flavour")
        }
        .accessibilityLabel("Add New Flavour")
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(flavours: .constant(Flavour.sampleData), isPresentingNewFlavourView: .constant(false))
    }
}
