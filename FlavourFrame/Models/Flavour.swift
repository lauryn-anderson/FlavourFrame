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
    var frame: UUID?
    var words: [Word]
    
    init(id: UUID = UUID(), name: String = "New Flavour", drawing: PKDrawing? = nil, frame: UUID? = nil, words: [Word] = []) {
        self.id = id
        self.name = name
        self.drawing = drawing
        self.frame = frame
        self.words = words
    }
    
    static var emptyFlavour: Flavour {
        Flavour()
    }
    
    mutating func assignWords(_ words: [Word]) {
        self.words = words
    }
}

extension Flavour {
    static let sampleData: [Flavour] = [
        Flavour(name: "Peppermint Tea", words: [Word()]),
        Flavour(name: "Honey Lemon Tea"),
        Flavour(name: "Chamomile Tea"),
    ]
}
