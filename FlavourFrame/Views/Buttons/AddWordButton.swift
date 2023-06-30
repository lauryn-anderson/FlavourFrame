//
//  AddWordButton.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-30.
//

import SwiftUI

struct AddWordButton: View {
    @Binding var words: [Word]
    
    var body: some View {
        Button {
            let newWord = Word()
            words.append(newWord)
        } label: {
            HStack {
                Image(systemName: "character.textbox")
//                Text(verbatim: String($words.wrappedValue.count))
            }
        }
    }
}

struct AddWordButton_Previews: PreviewProvider {
    static var previews: some View {
        AddWordButton(words: .constant([]))
    }
}
