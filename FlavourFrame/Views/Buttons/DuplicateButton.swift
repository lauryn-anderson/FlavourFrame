//
//  DuplicateButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-28.
//

import SwiftUI

struct DuplicateButton: View {
    @EnvironmentObject var data: DataManager
    var currentLayer: any Layer
    
    var body: some View {
        Button {
            let newName = "Copy of " + currentLayer.name
            var newLayer: any Layer = Flavour.emptyFlavour
            
            // create new layer from current one
            if let currentFlavour = currentLayer as? Flavour {
                newLayer = Flavour(id: UUID(), name: newName, drawing: currentFlavour.drawing, frame: currentFlavour.frame)
            } else if let currentFrame = currentLayer as? Frame {
                newLayer = Frame(id: UUID(), name: newName, drawing: currentFrame.drawing)
            }
            
            // save new layer to data
            withAnimation {
                data.store.addNewLayer(newLayer)
            }
        } label: {
            Text("Duplicate")
        }
    }
}

struct DuplicateButton_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        DuplicateButton(currentLayer: data.store.frames[0])
    }
}
