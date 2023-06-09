//
//  FlavourRow.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-09.
//

import SwiftUI

struct FlavourRow: View {
    var flavour: Flavour

    var body: some View {
        HStack {
//            landmark.image
//                .resizable()
//                .frame(width: 50, height: 50)
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
