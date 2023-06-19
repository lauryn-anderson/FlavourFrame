//
//  CanvasView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI
import PencilKit

struct CanvasView {
    @Binding var canvasView: PKCanvasView
    let picker = PKToolPicker.init()
    let onSaved: () -> Void
}

extension CanvasView: UIViewRepresentable {
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.isOpaque = false
        canvasView.delegate = context.coordinator
//        picker = PKToolPicker.init()
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        picker.addObserver(canvasView)
//        picker.addObserver(uiView)
        picker.setVisible(true, forFirstResponder: canvasView)
        Task {
            canvasView.becomeFirstResponder()
        }
        print(picker.selectedTool)
//        print("update")
    }
    
    func makeCoordinator() -> Coordinator {
      Coordinator(canvasView: $canvasView, onSaved: onSaved)
    }
}

class Coordinator: NSObject {
    var canvasView: Binding<PKCanvasView>
    let onSaved: () -> Void
    
    init(canvasView: Binding<PKCanvasView>, onSaved: @escaping () -> Void) {
        self.canvasView = canvasView
        self.onSaved = onSaved
    }
}

extension Coordinator: PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        if !canvasView.drawing.bounds.isEmpty {
            onSaved()
        }
    }
}
