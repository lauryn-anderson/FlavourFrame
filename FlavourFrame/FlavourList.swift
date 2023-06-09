//
//  FlavourList.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-09.
//

import SwiftUI

struct FlavourList: View {
    @EnvironmentObject var store: FlavourStore

    var body: some View {
        NavigationView {
            List {
                ForEach(store.flavours) { flavour in
                    NavigationLink {
                        DrawingView(flavour: flavour)
                    } label: {
                        FlavourRow(flavour: flavour)
                    }
                }
            }
            .navigationTitle("Flavours")
        }
    }
}

struct FlavourList_Previews: PreviewProvider {
    static var previews: some View {
        FlavourList()
            .environmentObject(FlavourStore())
    }
}
