//
//  DetailEditView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-16.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var flavour: Flavour
//    @State private var newAttendeeName = ""

    var body: some View {
        Form {
            TextField("Name", text: $flavour.name)
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(flavour: .constant(Flavour.sampleData[0]))
    }
}
