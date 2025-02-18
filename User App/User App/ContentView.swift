//
//  ContentView.swift
//  User App
//
//  Created by Enzo Müller on 12/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "book")
                .font(.system(size: 170))
                .foregroundStyle(.tint)
                .symbolVariant(.circle)
            Text("Hello, world!")
        }
        .padding()
        
    }
    }

#Preview {
    ContentView()
}
