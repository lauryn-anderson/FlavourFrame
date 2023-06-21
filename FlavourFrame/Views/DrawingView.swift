//
//  DrawingView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI
import PencilKit


struct DrawingView: View {
    @EnvironmentObject var data: DataManager

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
            CanvasView(canvasView: $canvasView, onSaved: saveDrawing)
        }
        .navigationTitle(flavour.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func saveDrawing() {
        guard let selectedFlavour else { return }
        data.store.assignDrawing(canvasView.drawing, to: selectedFlavour)
    }
    
    func restoreDrawing() {
        if let drawing = flavour.drawing {
            canvasView.drawing = drawing
        }
    }

    private var selectedFlavour: Flavour? {
        data.store.flavours.first { $0.id == flavour.id }
    }
}

struct DrawingView_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        DrawingView(flavour: Flavour.sampleData[0])
            .environmentObject(data)
    }
}
