//
//  NewFrameView.swift
//  FrameFrame
//
//  Created by Lauryn Anderson on 2023-06-21.
//

import SwiftUI

struct NewFrameView: View {
    @EnvironmentObject var data: DataManager
    @State private var newFrame = Frame.emptyFrame
    @Binding var isPresentingNewFrameView: Bool
    
    var body: some View {
        NavigationStack {
            FrameDetailView(frame: $newFrame)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewFrameView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            addNewFrame(newFrame)
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
}

struct NewFrameView_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        NewFrameView(isPresentingNewFrameView: .constant(true))
            .environmentObject(data)
    }
}
