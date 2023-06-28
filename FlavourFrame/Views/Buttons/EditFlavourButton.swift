//
//  EditButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-26.
//

import SwiftUI

struct EditFlavourButton: View {
    @Binding var isPresentingEditView: Bool
    @Binding var makingNew: Bool
    @Binding var targetFlavour: Flavour
    var currentFlavour: Flavour

    var body: some View {
        Button(action: {
            isPresentingEditView = true
            makingNew = false
            targetFlavour = currentFlavour
        }) {
            Text("Edit")
        }
    }
}

struct EditFlavourButton_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        EditFlavourButton(isPresentingEditView: .constant(true), makingNew: .constant(false), targetFlavour: .constant(data.store.flavours[0]), currentFlavour: data.store.flavours[0])
    }
}
