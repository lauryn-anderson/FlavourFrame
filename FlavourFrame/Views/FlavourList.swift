//
//  FlavourList.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-09.
//

import SwiftUI

struct FlavourList: View {
    @EnvironmentObject var store: FlavourStore

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(store.flavours) { flavour in
                    NavigationLink(value: flavour) {
                        FlavourRow(flavour: flavour)
                    }
                }
            }
        }
        .navigationTitle("Past Flavours")
        .navigationDestination(for: Flavour.self) { flavour in
            DrawingView(flavour: flavour)
        }
    }
}

struct FlavourList_Previews: PreviewProvider {
    static let store = FlavourStore(flavours: Flavour.sampleData)

    static var previews: some View {
        FlavourList()
            .environmentObject(store)
    }
}
