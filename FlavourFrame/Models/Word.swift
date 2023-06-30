//
//  Word.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-29.
//

import Foundation
import CoreGraphics

struct Word: Codable, Identifiable, Hashable {
    var id: UUID
    var text: String
    var offset: CGSize
    
    init(id: UUID = UUID(), text: String = "", offset: CGSize = CGSize()) {
        self.id = id
        self.text = text
        self.offset = offset
    }
}

extension CGSize: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(NSCoder.string(for: self).hashValue)
    }
}
