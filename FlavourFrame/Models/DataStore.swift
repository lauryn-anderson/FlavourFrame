//
//  DataStore.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import Foundation
import PencilKit
import SwiftUI


struct DataStore: Codable {
    
    var flavours: [Flavour]
    var frames: [Frame]
    
    init() {
        self.flavours = []
        self.frames = []
    }

    init(flavours: [Flavour], frames: [Frame]) {
        self.flavours = flavours
        self.frames = frames
    }

    mutating func assignDrawing(_ drawing: PKDrawing, to layer: any Layer) {
        if let flavour = layer as? Flavour {
            guard let index = flavours.firstIndex(of: flavour) else { return }
            var flavour = flavours[index]
            flavour.assignDrawing(drawing)
            flavours[index] = flavour
        }
        
        if let frame = layer as? Frame {
            guard let index = frames.firstIndex(of: frame) else { return }
            var frame = frames[index]
            frame.assignDrawing(drawing)
            frames[index] = frame
        }
    }
    
    mutating func addNewLayer(_ newLayer: any Layer) {
        if let newFlavour = newLayer as? Flavour {
            flavours.insert(newFlavour, at: 0)
        } else if let newFrame = newLayer as? Frame {
            frames.insert(newFrame, at: 0)
        }
    }
    
    mutating func updateLayer(_ layer: any Layer) {
        if let flavour = layer as? Flavour {
            if let flavourOffset = flavours.firstIndex(where: {$0.id == flavour.id}) {
                flavours[flavourOffset] = flavour
            }
        } else if let frame = layer as? Frame {
            if let frameOffset = frames.firstIndex(where: {$0.id == frame.id}) {
                frames[frameOffset] = frame
            }
        }
    }
}
