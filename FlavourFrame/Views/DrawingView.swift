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
            HStack {
                Spacer()
                TextField("Flavour", text: $flavour.name)
                Spacer()
            }
            CanvasView(canvasView: $canvasView)
        }
        .navigationTitle(flavour.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DrawingView_Previews: PreviewProvider {
    static let store = FlavourStore()

    static var previews: some View {
        DrawingView(flavour: .constant(Flavour.sampleData[0]))
            .environmentObject(store)
            .previewDevice("iPad (9th generation)")
    }
}
