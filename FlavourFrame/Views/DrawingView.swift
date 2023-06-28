//
//  FlavourDrawing.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI
import PencilKit


struct DrawingView: View {
    @EnvironmentObject var data: DataManager
    @State private var canvasView = PKCanvasView()
    var layer: any Layer
    
    @State var frameInk = PKInkingTool(.pen)
    @State var flavourInk = PKInkingTool(.marker)
    let eraser = PKEraserTool(.bitmap, width: 10)
    @State var isErasing = false

    init(layer: any Layer) {
        self.layer = layer
        if let drawing = layer.drawing {
            self.canvasView.drawing = drawing
        }
    }

    var body: some View {
        ZStack {
            if let flavour = layer as? Flavour {
                if let frame = data.store.getFrame(flavour.frame) {
                    Image(uiImage: frame.image)
                }
                CanvasView(canvasView: $canvasView, onSaved: saveDrawing, isErasing: $isErasing, eraser: eraser, ink: flavourInk)
            } else {
                CanvasView(canvasView: $canvasView, onSaved: saveDrawing, isErasing: $isErasing, eraser: eraser, ink: frameInk)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                RulerButton(isRulerActive: $canvasView.isRulerActive)
                PenButton(isErasing: $isErasing)
                EraserButton(isErasing: $isErasing)
                if layer is Flavour {
                    ColourButton(inkColor: $flavourInk.color)
                }
                UndoButton()
                RedoButton()
            }
        }
        .navigationTitle(layer.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func saveDrawing() {
        guard let selectedLayer else { return }
        data.store.assignDrawing(canvasView.drawing, to: selectedLayer)
    }
    
    func restoreDrawing() {
        if let drawing = layer.drawing {
            canvasView.drawing = drawing
        }
    }

    private var selectedLayer: (any Layer)? {
        if let flavour = layer as? Flavour {
            return data.store.flavours.first { $0.id == flavour.id }
        } else if let frame = layer as? Frame {
            return data.store.frames.first { $0.id == frame.id }
        }
        return nil
    }
}

struct DrawingView_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        // embedded preview includes toolbar
        NavigationStack {
            DrawingView(layer: Frame.sampleData[0])
                .environmentObject(data)
        }
    }
}
