//
//  FrameGrid.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-21.
//

import SwiftUI

struct FrameGrid: View {
    @EnvironmentObject var data: DataManager
    @Binding var path: NavigationPath
    @Binding var isPresentingEditView: Bool
    @Binding var targetFrame: Frame
    @Binding var makingNew: Bool

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(data.store.frames) { frame in
                        NavigationLink(value: frame) {
                            Menu {
                                EditFrameButton(isPresentingEditView: $isPresentingEditView, makingNew: $makingNew, targetFrame: $targetFrame, currentFrame: frame)
                                DuplicateButton(currentLayer: frame)
                                DeleteButton(currentLayer: frame)
                            } label: {
                                LayerTile(layer: frame)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Frames")
            .navigationDestination(for: Frame.self) { frame in
                DrawingView(layer: frame)
            }
            .toolbar {
                AddButton(isPresentingNewView: $isPresentingEditView, makingNew: $makingNew, layer: .frame)
            }
        }
    }
}

struct FrameGrid_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        FrameGrid(path: .constant(NavigationPath()), isPresentingEditView: .constant(false), targetFrame: .constant(data.store.frames[0]), makingNew: .constant(true))
            .environmentObject(data)
    }
}
