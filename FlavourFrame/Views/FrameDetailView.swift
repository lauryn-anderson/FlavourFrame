//
//  FrameDetailView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-21.
//

import SwiftUI

struct FrameDetailView: View {
    @Binding var frame: Frame

    var body: some View {
        Form {
            TextField("Name", text: $frame.name)
        }
    }
}

struct FrameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameDetailView(frame: .constant(Frame.sampleData[0]))

    }
}
