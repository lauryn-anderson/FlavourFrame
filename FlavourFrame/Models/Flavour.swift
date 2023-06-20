//
//  Flavour.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-15.
//

import Foundation
import PencilKit
import SwiftUI


struct Flavour: Codable, Identifiable, Hashable {
    
    var id = UUID()
    var name = "New Flavour"
    var drawing: PKDrawing?
    static var defaultImage = UIColor.secondarySystemBackground.image(CGSize(width: 1, height: 1))
    
    var image: UIImage {
        get {
            if let bounds = self.drawing?.bounds {
                if let thumbnail = self.drawing?.image(
                    from: bounds,
                    scale: 1
                ) { return thumbnail}
            }
            return Flavour.defaultImage
        }
    }
    
    static var emptyFlavour: Flavour {
        Flavour()
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        // The PKDrawing, which is not hashable, is not needed to determine
        // the uniqueness of the Flavour.
    }

    mutating func assignDrawing(_ drawing: PKDrawing) {
        self.drawing = drawing
    }
}

extension Flavour {
    static let sampleData: [Flavour] = [
        Flavour(id: UUID(), name: "Peppermint Tea", drawing: nil),
        Flavour(id: UUID(), name: "Honey Lemon Tea", drawing: nil),
        Flavour(id: UUID(), name: "Chamomile Tea", drawing: nil),
    ]
}

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
