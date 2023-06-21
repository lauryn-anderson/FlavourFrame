//
//  FrameView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-21.
//

import SwiftUI
import PencilKit


struct FrameView: View {
    @EnvironmentObject var data: DataManager
    @State private var canvasView = PKCanvasView()
    var frame: Frame

    init(frame: Frame) {
        self.frame = frame
        if let drawing = frame.drawing {
            self.canvasView.drawing = drawing
        }
    }

    var body: some View {
        VStack {
            CanvasView(canvasView: $canvasView, onSaved: saveDrawing)
        }
        .navigationTitle(frame.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func saveDrawing() {
        guard let selectedFrame else { return }
        data.store.assignDrawing(canvasView.drawing, to: selectedFrame)
    }
    
    func restoreDrawing() {
        if let drawing = frame.drawing {
            canvasView.drawing = drawing
        }
    }

    private var selectedFrame: Frame? {
        data.store.frames.first { $0.id == frame.id }
    }
}

struct FrameView_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        FrameView(frame: Frame.sampleData[0])
            .environmentObject(data)
    }
}
