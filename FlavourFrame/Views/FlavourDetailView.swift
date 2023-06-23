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

    var body: some View {
        Form {
            List {
                TextField("Name", text: $flavour.name)
                Picker(selection: $flavour.frame) {
                    Text("None").tag(nil as Frame?)
                    ForEach(data.store.frames, id: \.self) { frame in
                        Text(frame.name).tag(frame as Frame?)
                    }
                } label: {
                    Text("Frame")
                }
                .pickerStyle(.navigationLink)
            }
        }
    }
}

struct FlavourDetailView_Previews: PreviewProvider {
    static let data = DataManager(flavours: Flavour.sampleData, frames: Frame.sampleData)

    static var previews: some View {
        FlavourDetailView(flavour: .constant(Flavour.sampleData[0]))
            .environmentObject(data)
    }
}
