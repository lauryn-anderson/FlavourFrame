//
//  NewFlavourView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-16.
//

import SwiftUI

struct NewFlavourView: View {
    @State private var newFlavour = Flavour.emptyFlavour
    @Binding var flavours: [Flavour]
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
                            flavours.append(newFlavour)
                            isPresentingNewFlavourView = false
                        }
                    }
                }
        }
    }
}

struct NewFlavourView_Previews: PreviewProvider {
    static var previews: some View {
        NewFlavourView(flavours: .constant(Flavour.sampleData), isPresentingNewFlavourView: .constant(true))
    }
}
