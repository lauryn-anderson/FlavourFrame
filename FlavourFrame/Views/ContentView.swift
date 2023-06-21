//
//  ContentView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var data: DataManager

    // track navigation by storing on path
    @State private var path = NavigationPath()
    
    // track selected option (frames or flavours)
    let layers: [LayerType] = [.flavour, .frame]
    @State private var selected: LayerType? = .flavour

    // keep track of scenePhase (active/inactive/etc)
    @Environment(\.scenePhase) private var scenePhase

    // save action closure provided at instantiation
    let saveAction: () -> Void
    
    @State private var isPresentingNewFlavourView = false
    @State private var isPresentingNewFrameView = false

    var body: some View {
        NavigationSplitView {
            List(selection: $selected) {
                ForEach(layers) { layer in
                    switch layer {
                    case .flavour:
                        Text("Flavours")
                            .font(.headline)
                    case .frame:
                        Text("Frames")
                            .font(.headline)
                    }
                }
            }
        } detail: {
            switch selected {
            case .flavour:
                FlavourGrid(path: $path, isPresentingNewFlavourView: $isPresentingNewFlavourView)

            case .frame:
                FrameGrid(path: $path, isPresentingNewFrameView: $isPresentingNewFrameView)

            case .none:
                Spacer()
            }
        }
        .sheet(isPresented: $isPresentingNewFlavourView) {
            NewFlavourView(isPresentingNewFlavourView: $isPresentingNewFlavourView)
        }
        .sheet(isPresented: $isPresentingNewFrameView) {
            NewFrameView(isPresentingNewFrameView: $isPresentingNewFrameView)
        }
        // save changes whenever activity pauses
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        ContentView(saveAction: {})
            .previewDevice("iPad (9th generation)")
            .environmentObject(data)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
