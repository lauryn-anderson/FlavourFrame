//
//  TextView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-29.
//

import SwiftUI

struct TextView: View {
    @State private var totalOffset = CGSize.zero
    @State private var changedOffset = CGSize.zero
    @State private var text = "hi"
    
    var body: some View {
        HStack {
            Image(systemName: "arrow.up.and.down.and.arrow.left.and.right")
                .foregroundColor(.primary)
                .padding(3)
                .background(Color(UIColor.systemBackground))
                .clipShape(Circle())
                .offset(changedOffset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            changedOffset = CGSize(width: gesture.translation.width + totalOffset.width, height: gesture.translation.height + totalOffset.height)
                        }
                        .onEnded { gesture in
                            changedOffset = CGSize(width: gesture.translation.width + totalOffset.width, height: gesture.translation.height + totalOffset.height)
                            totalOffset = changedOffset
                        }
                )
                .onTapGesture {
                    self.endTextEditing()
                }
            TextField("", text: $text)
                .textInputAutocapitalization(.never)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: true, vertical: false)
                .textFieldStyle(.roundedBorder)
                .offset(changedOffset)
        }
        .fixedSize()
    }
}

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
