//
//  FrameDetailView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-21.
//

import SwiftUI

struct FrameDetailView: View {
    @EnvironmentObject var data: DataManager
    @Binding var frame: Frame
    @State var newFrame = Frame.emptyFrame
    @Binding var makingNew: Bool
    @Binding var isPresentingNewFrameView: Bool
    
    var body: some View {
        NavigationStack {
            // if necessary, create new frame, otherwise edit existing
            FrameDetailForm(frame: makingNew ? $newFrame : $frame)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewFrameView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            withAnimation {
                                if makingNew {
                                    data.store.addNewFrame(newFrame)
                                } else {
                                    data.store.updateFrame(frame)
                                }
                            }
                            isPresentingNewFrameView = false
                        }
                    }
                }
        }
    }
}

struct FrameDetailForm: View {
    @Binding var frame: Frame

    var body: some View {
        Form {
            TextField("Name", text: $frame.name)
        }
    }
}

struct NewFrameView_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        FrameDetailView(frame: .constant(data.store.frames[0]), makingNew: .constant(true), isPresentingNewFrameView: .constant(true))
            .environmentObject(data)
    }
}
