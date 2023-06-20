//
//  ContentView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var store: FlavourStore

    // track navigation by storing on path
    @State private var path = NavigationPath()

    // keep track of scenePhase (active/inactive/etc)
    @Environment(\.scenePhase) private var scenePhase

    // save action closure provided at instantiation
    let saveAction: () -> Void
    @State private var isPresentingNewScrumView = false

    var body: some View {
        NavigationSplitView {
//            AddButton(flavours: $flavours, isPresentingNewFlavourView: $isPresentingNewScrumView)
        } detail: {
            NavigationStack(path: $path) {
                FlavourList()
                    .navigationTitle("Flavours")
                Spacer()
            }
            .toolbar {
                AddButton(flavours: $store.flavours, isPresentingNewFlavourView: $isPresentingNewScrumView)
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewFlavourView(isPresentingNewFlavourView: $isPresentingNewScrumView)
        }
        // save changes whenever activity pauses
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let store = FlavourStore(flavours: Flavour.sampleData)

    static var previews: some View {
        ContentView(saveAction: {})
            .previewDevice("iPad (9th generation)")
            .environmentObject(store)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
