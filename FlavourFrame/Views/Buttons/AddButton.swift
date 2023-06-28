//
//  AddButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-12.
//

import SwiftUI

struct AddButton: View {
    @Binding var isPresentingNewView: Bool
    @Binding var makingNew: Bool
    var layer: LayerType

    var body: some View {
        Button(action: {
            isPresentingNewView = true
            makingNew = true
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
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        AddButton(isPresentingNewView: .constant(false), makingNew: .constant(true), layer: .frame)
    }
}
