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
    @State private var words: [Word] = []
    var layer: any Layer
    
    @State var frameInk = PKInkingTool(.pen)
    @State var flavourInk = PKInkingTool(.marker)
    let eraser = PKEraserTool(.bitmap, width: 10)
    @State var isErasing = false

    init(layer: any Layer) {
        self.layer = layer
        
        // restore drawing if it exists
        if let drawing = layer.drawing {
            self.canvasView.drawing = drawing
        }
        
        // restore words if they exist
        if let flavour = layer as? Flavour {
            _words = State(initialValue: flavour.words)
        }
    }

    var body: some View {
        ZStack {
            if let flavour = layer as? Flavour {
                if let frame = data.store.getFrame(flavour.frame) {
                    Image(uiImage: frame.image)
                }
                CanvasView(canvasView: $canvasView, onSaved: saveDrawing, isErasing: $isErasing, eraser: eraser, ink: flavourInk)
                Group {
                    ForEach($words) { $word in
                        TextView(text: $word.text, totalOffset: $word.offset, save: saveWords)
                    }
                }
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
                if layer is Flavour {
                    AddWordButton(words: $words)
                }
            }
        }
        .navigationTitle(layer.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func saveDrawing() {
        data.store.assignDrawing(canvasView.drawing, to: layer)
        // difficult to save words enough, so add it here too
        saveWords()
    }
    
    func saveWords() {
        if let flavour = layer as? Flavour {
            data.store.assignWords(words, to: flavour.id)
        }
    }
}

struct DrawingView_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        // embedded preview includes toolbar
        NavigationStack {
            DrawingView(layer: Flavour.sampleData[0])
                .environmentObject(data)
        }
    }
}
