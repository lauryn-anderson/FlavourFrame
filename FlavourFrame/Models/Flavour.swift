//
//  Flavour.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-15.
//

import Foundation
import PencilKit

struct Flavour: Codable, Identifiable {
    var id = UUID()
    var name = "New Flavour"
    var drawing: PKDrawing?
}

extension Flavour {
    static let sampleData: [Flavour] = [
        Flavour(id: UUID(), name: "Peppermint Tea", drawing: nil),
        Flavour(id: UUID(), name: "Honey Lemon Tea", drawing: nil),
        Flavour(id: UUID(), name: "Chamomile Tea", drawing: nil),
    ]
}
