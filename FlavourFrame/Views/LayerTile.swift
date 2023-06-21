//
//  LayerGrid.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-21.
//

import SwiftUI


struct LayerTile: View {
    let layer: any Layer

    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: layer.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .accessibilityLabel("drawing of \(layer.name)")
                .padding()
            Spacer()
            Text(layer.name)
            Spacer()
        }
        .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
    }
}

struct LayerTile_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        LayerTile(layer: Flavour.emptyFlavour)
    }
}
