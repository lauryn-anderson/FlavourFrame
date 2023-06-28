//
//  FlavourDetailView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-16.
//

import SwiftUI

struct FlavourDetailView: View {
    @EnvironmentObject var data: DataManager
    @Binding var flavour: Flavour
    @State var newFlavour = Flavour.emptyFlavour
    @Binding var makingNew: Bool
    @Binding var isPresentingNewFlavourView: Bool
    
    var body: some View {
        NavigationStack {
            // if necessary, create new flavour, otherwise edit existing
            FlavourDetailForm(flavour: makingNew ? $newFlavour : $flavour)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewFlavourView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            withAnimation {
                                if makingNew {
                                    data.store.addNewLayer(newFlavour)
                                } else {
                                    data.store.updateLayer(flavour)
                                }
                            }
                            isPresentingNewFlavourView = false
                        }
                    }
                }
        }
    }
}

struct FlavourDetailForm: View {
    @EnvironmentObject var data: DataManager
    @Binding var flavour: Flavour

    var body: some View {
        Form {
            List {
                TextField("Name", text: $flavour.name)
                Picker(selection: $flavour.frame) {
                    Text("None").tag(nil as UUID?)
                    ForEach(data.store.frames, id: \.self) { frame in
                        Text(frame.name).tag(frame.id as UUID?)
                    }
                } label: {
                    Text("Frame")
                }
                .pickerStyle(.navigationLink)
            }
        }
    }
}

struct NewFlavourView_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        FlavourDetailView(flavour: .constant(data.store.flavours[0]), makingNew: .constant(true), isPresentingNewFlavourView: .constant(false))
            .environmentObject(data)
    }
}
