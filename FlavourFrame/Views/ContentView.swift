//
//  ContentView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI

struct ContentView: View {
    @Binding var flavours: [Flavour]
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
                FlavourList(flavours: $flavours)
                    .navigationTitle("Past Flavours")
                AddButton(flavours: $flavours, isPresentingNewFlavourView: $isPresentingNewScrumView)
                Spacer()
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewFlavourView(flavours: $flavours, isPresentingNewFlavourView: $isPresentingNewScrumView)
        }
        // save changes whenever activity pauses
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(flavours: .constant(Flavour.sampleData), saveAction: {})
            .previewDevice("iPad (9th generation)")
//            .environmentObject(FlavourStore())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}