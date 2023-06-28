//
//  DeleteButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-28.
//

import SwiftUI

struct DeleteButton: View {
    @EnvironmentObject var data: DataManager
    var currentLayer: any Layer

    var body: some View {
        Button(role: .destructive) {
            withAnimation {
                data.store.deleteLayer(currentLayer)
            }
        } label: {
            Text("Delete")
        }
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)
    
    static var previews: some View {
        DeleteButton(currentLayer: data.store.flavours[0])
    }
}
