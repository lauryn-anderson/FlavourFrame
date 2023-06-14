//
//  FlavourRow.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-09.
//

import SwiftUI

struct FlavourRow: View {
    var flavour: Flavour
    let thumbnailSize = CGSize(width: 150, height: 150)
    
    var body: some View {
        VStack {
            
            if let thumbnail = flavour.drawing?.image(
                from: CGRect(origin: CGPointZero, size: thumbnailSize),
                scale: 0.5
            ) {
                Image(uiImage: thumbnail)
            } else {
                Image(size: thumbnailSize) { context in
                    context.fill(
                        Path(CGRect(origin: CGPointZero, size: thumbnailSize)),
                        with: .color(.accentColor))
                }
            }
            
            Text(flavour.name)
            Spacer()
        }
    }
}

struct FlavourRow_Previews: PreviewProvider {
    static var previews: some View {
        FlavourRow(flavour: Flavour(id: UUID(), name: "Burger", drawing: nil))
    }
}
