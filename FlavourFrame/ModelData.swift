//
//  ModelData.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import Foundation
import PencilKit


final class FlavourStore: ObservableObject {
    @Published var flavours: [Flavour] = load("flavours.json")
}

struct Flavour: Codable, Identifiable {
    var id = UUID()
    var name = ""
    var drawing: PKDrawing?
}

//var flavourData: [Flavour] = load("flavours.json")
//var testFlavours = FlavourStore(flavours: flavourData)

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
