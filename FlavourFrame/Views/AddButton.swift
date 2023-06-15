//
//  AddButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-12.
//

import SwiftUI

struct AddButton: View {
    @Binding var flavours: [Flavour]

    var body: some View {
        Button {
//            flavours.append(Flavour())
        } label: {
            Text("+ New Flavour")
        }
        .foregroundColor(.accentColor)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(flavours: .constant(Flavour.sampleData))
    }
}
