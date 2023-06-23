//
//  Layer.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-21.
//

import Foundation
import PencilKit
import SwiftUI


protocol Layer: Codable, Identifiable, Hashable {
    var id: UUID { get }
    var name: String { get set }
    var drawing: PKDrawing? { get set }
    var image: UIImage? { get }
    var bounds: CGRect? { get }
}

extension Layer {
    var image: UIImage? {
        get {
            if let bounds = self.bounds {
                if let thumbnail = self.drawing?.image(
                    from: bounds,
                    scale: 1
                ) { return thumbnail}
            }
            return nil
        }
    }
    
    func hash(into hasher: inout Hasher) {
        // The PKDrawing, which is not hashable, is not needed to determine
        // the uniqueness of the Layer.
        hasher.combine(id)
        hasher.combine(name)
    }
    
    mutating func assignDrawing(_ drawing: PKDrawing) {
        self.drawing = drawing
    }
}

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

enum LayerType: Identifiable {
    var id: Self { self }
    case flavour, frame
}
