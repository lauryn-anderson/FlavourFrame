//
//  AddButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-12.
//

import SwiftUI

struct AddButton: View {
    @Binding var isPresentingNewView: Bool
    var layer: LayerType
    let thumbnailSize = CGSize(width: 150, height: 150)

    var body: some View {
        Button(action: {
            isPresentingNewView = true
        }) {
            switch layer {
            case .flavour:
                Text("+ New Flavour")
                    .accessibilityLabel("Add New Flavour")
            case .frame:
                Text("+ New Frame")
                    .accessibilityLabel("Add New Frame")
            }
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(isPresentingNewView: .constant(false), layer: .frame)
    }
}
