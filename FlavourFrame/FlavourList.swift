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
//        NavigationView {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(store.flavours) { flavour in
                    NavigationLink {
                        DrawingView(flavour: flavour)
                    } label: {
                        FlavourRow(flavour: flavour)
                    }
                }
                .onDelete { store.flavours.remove(atOffsets: $0) }
                .onMove { store.flavours.move(fromOffsets: $0, toOffset: $1) }
            }
        }
        .navigationTitle("Past Flavours")
//            .toolbar {
//                ToolbarItemGroup {
//                    EditButton()
//                }
//            }
//        }
    }
}

struct FlavourList_Previews: PreviewProvider {
    static var previews: some View {
        FlavourList()
            .environmentObject(FlavourStore())
    }
}
