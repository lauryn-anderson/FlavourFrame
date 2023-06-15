//
//  FlavourList.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-09.
//

import SwiftUI

struct FlavourList: View {
    @Binding var flavours: [Flavour]
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach($flavours) { $flavour in
                    NavigationLink {
                        DrawingView(flavour: $flavour)
                    } label: {
                        FlavourRow(flavour: flavour)
                    }
                }
            }
        }
        .navigationTitle("Past Flavours")
    }
}

struct FlavourList_Previews: PreviewProvider {
    static var previews: some View {
        FlavourList(flavours: .constant(Flavour.sampleData))
    }
}
