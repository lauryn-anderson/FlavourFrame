//
//  Flavour.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-15.
//

import Foundation
import PencilKit
import SwiftUI


struct Flavour: Layer {
    var id: UUID
    var name: String
    var drawing: PKDrawing?
    var frame: Frame?
    
    init() {
        self.id = UUID()
        self.name = "New Flavour"
        self.drawing = nil
        self.frame = nil
    }
    
    init(id: UUID, name: String, drawing: PKDrawing?, frame: Frame?) {
        self.id = id
        self.name = name
        self.drawing = drawing
        self.frame = frame
    }
    
    static var emptyFlavour: Flavour {
        Flavour()
    }
}

extension Flavour {
    static let sampleData: [Flavour] = [
        Flavour(id: UUID(), name: "Peppermint Tea", drawing: nil, frame: nil),
        Flavour(id: UUID(), name: "Honey Lemon Tea", drawing: nil, frame: nil),
        Flavour(id: UUID(), name: "Chamomile Tea", drawing: nil, frame: nil),
    ]
}
