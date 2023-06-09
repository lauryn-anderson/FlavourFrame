//
//  ContentView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: FlavourStore
        
    var body: some View {
        List(store.flavours) { flavour in
            FlavourRow(flavour: flavour)
        }
    }
}

struct FlavourRow: View {
    var flavour: Flavour

    var body: some View {
        NavigationLink(flavour.name, destination: DrawingView(flavour: flavour))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testFlavours)
            .previewDevice("iPad (9th generation)")
    }
}
