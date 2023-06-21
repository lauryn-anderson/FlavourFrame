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
    @Binding var isPresentingNewFrameView: Bool

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(data.store.frames) { frame in
                        NavigationLink(value: frame) {
                            LayerTile(layer: frame)
                        }
                    }
                }
            }
            .navigationTitle("Frames")
            .navigationDestination(for: Frame.self) { frame in
//                DrawingView(frame: frame)
                Text(frame.name)
            }
            .toolbar {
                AddButton(isPresentingNewView: $isPresentingNewFrameView, layer: .frame)
            }
        }
    }
}

struct FrameGrid_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        FrameGrid(path: .constant(NavigationPath()), isPresentingNewFrameView: .constant(false))
            .environmentObject(data)
    }
}
