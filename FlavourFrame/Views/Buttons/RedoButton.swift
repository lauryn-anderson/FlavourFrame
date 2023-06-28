//
//  RedoButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-26.
//

import SwiftUI

struct RedoButton: View {
    @Environment(\.undoManager) private var undoManager

    var body: some View {
        Button {
            undoManager?.redo()
        } label: {
            Image(systemName: "arrow.uturn.forward.circle")
        }
    }
}

struct RedoButton_Previews: PreviewProvider {
    static var previews: some View {
        RedoButton()
    }
}
