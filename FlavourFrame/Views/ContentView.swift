//
//  ContentView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI

let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

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
    
    @State private var isPresentingEditFlavourView = false
    @State private var isPresentingEditFrameView = false
    @State var targetFlavour: Flavour = Flavour.emptyFlavour
    @State var targetFrame: Frame = Frame.emptyFrame
    @State var makingNew: Bool = true

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
                FlavourGrid(path: $path, isPresentingEditView: $isPresentingEditFlavourView, targetFlavour: $targetFlavour, makingNew: $makingNew)

            case .frame:
                FrameGrid(path: $path, isPresentingEditView: $isPresentingEditFrameView, targetFrame: $targetFrame, makingNew: $makingNew)

            case .none:
                Spacer()
            }
        }
        .sheet(isPresented: $isPresentingEditFlavourView) {
            FlavourDetailView(flavour: $targetFlavour, makingNew: $makingNew, isPresentingNewFlavourView: $isPresentingEditFlavourView)
        }
        .sheet(isPresented: $isPresentingEditFrameView) {
            FrameDetailView(frame: $targetFrame, makingNew: $makingNew, isPresentingNewFrameView: $isPresentingEditFrameView)
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
