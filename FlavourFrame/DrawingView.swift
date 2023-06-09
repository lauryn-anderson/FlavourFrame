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
    var flavour: Flavour
//    @Binding var flavour: Flavour

    var body: some View {
        VStack {
            Text("Flavour")
//            TextField("Flavour", text: $flavour.name)
            CanvasView(canvasView: $canvasView)
        }
    }
}

//struct DrawingView_Previews: PreviewProvider {
//    
//    @State var flavour = Flavour()
//    
//    static var previews: some View {
//        DrawingView(flavour: )
//            .previewDevice("iPad (9th generation)")
//    }
//}
