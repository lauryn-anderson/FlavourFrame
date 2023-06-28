//
//  UndoButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-26.
//

import SwiftUI

struct UndoButton: View {
    @Environment(\.undoManager) private var undoManager

    var body: some View {
        Button {
            undoManager?.undo()
        } label: {
            Image(systemName: "arrow.uturn.backward.circle")
        }
    }
}

struct UndoButton_Previews: PreviewProvider {
    static var previews: some View {
        UndoButton()
    }
}
