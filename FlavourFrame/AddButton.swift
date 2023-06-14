//
//  AddButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-12.
//

import SwiftUI

struct AddButton: View {
    @EnvironmentObject var store: FlavourStore

    var body: some View {
        Button {
            store.flavours.append(Flavour())
        } label: {
            Text("+ New Flavour")
        }
        .foregroundColor(.accentColor)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
