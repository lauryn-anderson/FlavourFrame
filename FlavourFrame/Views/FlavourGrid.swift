//
//  FlavourGrid.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-09.
//

import SwiftUI

struct FlavourGrid: View {
    @EnvironmentObject var data: DataManager
    @Binding var path: NavigationPath
    @Binding var isPresentingNewFlavourView: Bool

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(data.store.flavours) { flavour in
                        NavigationLink(value: flavour) {
                            LayerTile(layer: flavour)
                        }
                    }
                }
            }
            .navigationTitle("Flavours")
            .navigationDestination(for: Flavour.self) { flavour in
                DrawingView(layer: flavour)
            }
            .toolbar {
                AddButton(isPresentingNewView: $isPresentingNewFlavourView, layer: .flavour)
            }
        }
    }
}

struct FlavourGrid_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        FlavourGrid(path: .constant(NavigationPath()), isPresentingNewFlavourView: .constant(false))
            .environmentObject(data)
    }
}
