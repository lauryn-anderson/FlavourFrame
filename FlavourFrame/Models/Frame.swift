//
//  Frame.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-20.
//

import Foundation
import PencilKit
import SwiftUI


struct Frame: Layer {
    var id = UUID()
    var name = "New Frame"
    var drawing: PKDrawing?
    
    init() {
        self.id = UUID()
        self.name = "New Frame"
        self.drawing = nil
    }
    
    init(id: UUID, name: String, drawing: PKDrawing?) {
        self.id = id
        self.name = name
        self.drawing = drawing
    }
    
    static var emptyFrame: Frame {
        Frame()
    }
    
    var bounds: CGRect? {
        get {
            return self.drawing?.bounds
        }
    }
}

extension Frame {
    static let sampleData: [Frame] = [
        Frame(id: UUID(), name: "Blank", drawing: nil),
        Frame(id: UUID(), name: "Also Blank", drawing: nil),
    ]
}
