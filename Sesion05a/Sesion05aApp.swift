//
//  Sesion05aApp.swift
//  Sesion05a
//
//  Created by Asuma Toki on 12/10/24.
//

import SwiftUI

@main
struct Sesion05aApp: App {
    let persistence = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(
                    \.managedObjectContext,
                     persistence.container.viewContext
                )
        }
    }
}
