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
        
    init(id: UUID = UUID(), name: String = "New Frame", drawing: PKDrawing? = nil) {
        self.id = id
        self.name = name
        self.drawing = drawing
    }
    
    static var emptyFrame: Frame {
        Frame()
    }
}

extension Frame {
    static let sampleData: [Frame] = [
        Frame(name: "Blank"),
        Frame(name: "Also Blank"),
    ]
}
