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
                            if makingNew {
                                addNewFrame(newFrame)
                            } else {
                                updateFrame(frame)
                            }
                            isPresentingNewFrameView = false
                        }
                    }
                }
        }
    }
    
    private func addNewFrame(_ newFrame: Frame) {
        withAnimation {
            data.store.frames.insert(newFrame, at: 0)
        }
    }
    
    private func updateFrame(_ frame: Frame) {
        if let frameOffset = data.store.frames.firstIndex(where: {$0.id == frame.id}) {
            data.store.frames[frameOffset] = frame
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
