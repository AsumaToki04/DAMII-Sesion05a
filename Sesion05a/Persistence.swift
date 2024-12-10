//
//  Persistence.swift
//  Sesion05a
//
//  Created by Asuma Toki on 12/10/24.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Sesion05a")
        container.loadPersistentStores {_, error in
            if let e = error as NSError? {
                fatalError("Ocurrió un error: \(e)")
            }
        }
    }
}
