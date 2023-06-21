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
    var id = UUID()
    var name = "New Flavour"
    var drawing: PKDrawing? = nil
    
    init() {
        self.id = UUID()
        self.name = "New Flavour"
        self.drawing = nil
    }
    
    init(id: UUID, name: String, drawing: PKDrawing?) {
        self.id = id
        self.name = name
        self.drawing = drawing
    }
    
    static var emptyFlavour: Flavour {
        Flavour()
    }
}

extension Flavour {
    static let sampleData: [Flavour] = [
        Flavour(id: UUID(), name: "Peppermint Tea", drawing: nil),
        Flavour(id: UUID(), name: "Honey Lemon Tea", drawing: nil),
        Flavour(id: UUID(), name: "Chamomile Tea", drawing: nil),
    ]
}
