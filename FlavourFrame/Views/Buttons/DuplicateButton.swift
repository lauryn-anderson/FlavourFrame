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
            if let currentFlavour = currentLayer as? Flavour {
                // create copy of flavour and save it
                let newFlavour = Flavour(id: UUID(), name: newName, drawing: currentFlavour.drawing, frame: currentFlavour.frame)
                withAnimation {
                    data.store.addNewFlavour(newFlavour)
                }
            } else if let currentFrame = currentLayer as? Frame {
                // create copy of frame and save it
                let newFrame = Frame(id: UUID(), name: newName, drawing: currentFrame.drawing)
                withAnimation {
                    data.store.addNewFrame(newFrame)
                }
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
