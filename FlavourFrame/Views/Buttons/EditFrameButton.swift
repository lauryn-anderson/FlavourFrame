//
//  EditFrameView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-27.
//

import SwiftUI

struct EditFrameButton: View {
    @Binding var isPresentingEditView: Bool
    @Binding var makingNew: Bool
    @Binding var targetFrame: Frame
    var currentFrame: Frame

    var body: some View {
        Button(action: {
            isPresentingEditView = true
            makingNew = false
            targetFrame = currentFrame
        }) {
            Text("Edit")
        }
    }
}

struct EditFrameButton_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        EditFrameButton(isPresentingEditView: .constant(true), makingNew: .constant(false), targetFrame: .constant(data.store.frames[0]), currentFrame: data.store.frames[0])
    }
}
