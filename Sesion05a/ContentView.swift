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
    @State private var contador = 1
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    await agregarUsuario()
                }
            }) {
                if isLoading {
                    ProgressView()
                } else {
                    Text("Agregar usuario")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            
            List {
                ForEach(usuarios) { item in
                    VStack(alignment: .leading) {
                        Text(item.nombre ?? "Sin nombre")
                            .font(.headline)
                        Text(item.email ?? "Sin correo")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .onAppear {
            if usuarios.count > 0 {
                contador = usuarios.count
            }
        }
    }
    
    private func agregarUsuario() async {
        isLoading = true
        //Thread.sleep(forTimeInterval: 3) // pausa de 3 segundos
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        await viewContext.perform {
            withAnimation {
                let nuevoUsuario = Usuario(context: viewContext)
                nuevoUsuario.id = UUID()
                nuevoUsuario.nombre = "Usuario \(String(format: "%02d", contador))"
                nuevoUsuario.email = "usuario\(String(format: "%02d", contador))@hotmail.com"
                do {
                    try viewContext.save()
                    contador += 1
                } catch {
                    print("Error al guardar: \(error)")
                }
            }
            isLoading = false
        }
    }
}
