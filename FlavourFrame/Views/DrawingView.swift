//
//  DrawingView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI
import PencilKit


struct DrawingView: View {
    @EnvironmentObject var store: FlavourStore

    @State private var canvasView = PKCanvasView()

    var flavour: Flavour

    init(flavour: Flavour) {
        self.flavour = flavour
        if let drawing = flavour.drawing {
            self.canvasView.drawing = drawing
        }
    }

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
        // TODO: create and save image as well
        // flavour.drawing = canvasView.drawing
        // 1
//        let image = canvasView.drawing.image(from: canvasView.bounds, scale: UIScreen.main.scale)
        // 2
//        let flavour = Flavour(
//            id: self.flavour.id,
//            name: self.flavour.name,
//            drawing: canvasView.drawing
//        )
        
        // GOAL: assign canvas

//        flavour.assignDrawing(canvasView.drawing)
        guard let selectedFlavour else { return }
        store.assignDrawing(canvasView.drawing, to: selectedFlavour)
        print("saved")

//        self.flavour.drawing = flavour.drawing
//        _flavour.drawing = canvasView.drawing
//        self.flavour = flavour

    }
    
    func restoreDrawing() {
        if let drawing = flavour.drawing {
            canvasView.drawing = drawing
        }
    }

    private var selectedFlavour: Flavour? {
        store.flavours.first { $0.id == flavour.id }
    }
}

struct DrawingView_Previews: PreviewProvider {
    static let store = FlavourStore()

    static var previews: some View {
        DrawingView(flavour: Flavour.sampleData[0])
            .environmentObject(store)
    }
}
