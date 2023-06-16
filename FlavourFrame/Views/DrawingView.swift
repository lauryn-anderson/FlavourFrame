//
//  DrawingView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI
import PencilKit


struct DrawingView: View {
    @State private var canvasView = PKCanvasView()
    @Binding var flavour: Flavour

    var body: some View {
        VStack {
//            HStack {
//                Spacer()
//                TextField("Flavour", text: $flavour.name)
//                Spacer()
//            }
            CanvasView(canvasView: $canvasView, onSaved: saveDrawing)
        }
        .navigationTitle(flavour.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func saveDrawing() {
        print("saved")
        // TODO: create and save image as well
        // flavour.drawing = canvasView.drawing
        // 1
//        let image = canvasView.drawing.image(from: canvasView.bounds, scale: UIScreen.main.scale)
        // 2
        let flavour = Flavour(
            id: self.flavour.id,
            name: self.flavour.name,
            drawing: canvasView.drawing
        )
        
        // GOAL: assign canvas
        self.flavour.drawing = flavour.drawing
//        _flavour.drawing = canvasView.drawing
//        self.flavour = flavour

    }
    
    func restoreDrawing() {
        if let drawing = flavour.drawing {
            canvasView.drawing = drawing
        }
    }
}

struct DrawingView_Previews: PreviewProvider {
    static let store = FlavourStore()

    static var previews: some View {
        DrawingView(flavour: .constant(Flavour.sampleData[0]))
    }
}
