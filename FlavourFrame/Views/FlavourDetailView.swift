//
//  FlavourDetailView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-16.
//

import SwiftUI

struct FlavourDetailView: View {
    @Binding var flavour: Flavour

    var body: some View {
        Form {
            TextField("Name", text: $flavour.name)
        }
    }
}

struct FlavourDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlavourDetailView(flavour: .constant(Flavour.sampleData[0]))
    }
}
