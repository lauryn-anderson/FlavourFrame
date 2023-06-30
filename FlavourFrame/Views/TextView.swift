//
//  TextView.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-29.
//

import SwiftUI

struct TextView: View {
    @Binding var text: String
    @Binding var totalOffset: CGSize
    @State private var changedOffset: CGSize
    let save: () -> Void
    
    init(text: Binding<String>, totalOffset: Binding<CGSize>, save: @escaping () -> Void) {
        _text = text
        _totalOffset = totalOffset
        self.save = save
        // initialize local offset to saved value
        changedOffset = totalOffset.wrappedValue
    }

    var body: some View {
        HStack {
            // image allows text to be dragged on drag gesture
            // and for keyboard to be dismissed on tap gesture
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
                            save()
                        }
                )
                .onTapGesture {
                    self.endTextEditing()
                    save()
                }
            TextField("", text: $text) {
                // executes when Return key is hit on keyboard
                self.endTextEditing()
                save()
            }
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
        // removes focus from text field
        // and dismisses keyboard if necessary
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: .constant("hi"), totalOffset: .constant(CGSize()), save: {})
    }
}
