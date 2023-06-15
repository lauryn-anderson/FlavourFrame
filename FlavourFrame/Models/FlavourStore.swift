//
//  FlavourStore.swift
//  FlavourFrame
//
//  Created by Lauryn Anderson on 2023-06-08.
//

import Foundation
import PencilKit
import SwiftUI


@MainActor
class FlavourStore: ObservableObject {
    @Published var flavours: [Flavour] = []
    
    // keep file for flavour data in user's Documents directory
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("flavours.data")
    }
    
    // load flavour data from file
    func load() async throws {
        let task = Task<[Flavour], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let flavourArray = try JSONDecoder().decode([Flavour].self, from: data)
            return flavourArray
        }
        let flavours = try await task.value
        self.flavours = flavours
    }
    
    // save flavour data to file
    func save(flavours: [Flavour]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(flavours)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
