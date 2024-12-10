//
//  ContentView.swift
//  Sesion05a
//
//  Created by Asuma Toki on 12/10/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Usuario.nombre, ascending: true)],
        animation: .default
    )
    private var usuarios: FetchedResults<Usuario>
    
    var body: some View {
        VStack {
            List {
                ForEach(usuarios) { item in
                    VStack(alignment: .leading) {
                        Text(item.nombre ?? "Sin nombre")
                            .font(.headline)
                    }
                }
            }
        }
    }
}
