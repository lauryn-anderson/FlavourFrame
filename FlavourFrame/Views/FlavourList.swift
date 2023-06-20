//
//  FlavourList.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-09.
//

import SwiftUI

struct FlavourList: View {
    @EnvironmentObject var store: FlavourStore

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(store.flavours) { flavour in
                    NavigationLink(value: flavour) {
                        VStack {
                            Spacer()
                            Image(uiImage: flavour.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .accessibilityLabel("drawing of \(flavour.name)")
                                .padding()
                            Spacer()
                            Text(flavour.name)
                            Spacer()
                        }
                        .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
                    }
                }
            }
        }
        .navigationTitle("Past Flavours")
        .navigationDestination(for: Flavour.self) { flavour in
            DrawingView(flavour: flavour)
        }
    }
}

struct FlavourList_Previews: PreviewProvider {
    static let store = FlavourStore(flavours: Flavour.sampleData)

    static var previews: some View {
        FlavourList()
            .environmentObject(store)
    }
}
