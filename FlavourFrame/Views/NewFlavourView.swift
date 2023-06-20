//
//  NewFlavourView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-16.
//

import SwiftUI

struct NewFlavourView: View {
    @EnvironmentObject var store: FlavourStore

    @State private var newFlavour = Flavour.emptyFlavour

    @Binding var isPresentingNewFlavourView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(flavour: $newFlavour)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewFlavourView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            addNewFlavour(newFlavour)
                            isPresentingNewFlavourView = false
                        }
                    }
                }
        }
    }

    private func addNewFlavour(_ newFlavour: Flavour) {
//        withAnimation {
            store.flavours.insert(newFlavour, at: 0)
//        }
    }
}

struct NewFlavourView_Previews: PreviewProvider {
    static let store = FlavourStore(flavours: Flavour.sampleData)

    static var previews: some View {
        NewFlavourView(isPresentingNewFlavourView: .constant(true))
            .environmentObject(store)
    }
}
