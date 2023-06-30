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
    @Binding var isPresentingEditView: Bool
    @Binding var targetFlavour: Flavour
    @Binding var makingNew: Bool

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(data.store.flavours) { flavour in
                        NavigationLink(value: flavour) {
                            Menu {
                                EditFlavourButton(isPresentingEditView: $isPresentingEditView, makingNew: $makingNew, targetFlavour: $targetFlavour, currentFlavour: flavour)
                                DuplicateButton(currentLayer: flavour)
                                DeleteButton(currentLayer: flavour)
                            } label: {
                                LayerTile(layer: flavour)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Flavours")
            .navigationDestination(for: Flavour.self) { flavour in
                DrawingView(layer: flavour)
            }
            .toolbar {
                AddLayerButton(isPresentingNewView: $isPresentingEditView, makingNew: $makingNew, layer: .flavour)
            }
        }
    }
}

struct FlavourGrid_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        FlavourGrid(path: .constant(NavigationPath()), isPresentingEditView: .constant(false), targetFlavour: .constant(data.store.flavours[0]), makingNew: .constant(true))
            .environmentObject(data)
    }
}
