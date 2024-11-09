//
//  ContentView.swift
//  Bullseye
//
//  Created by holtenko on 2024/11/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome to my first app!")
                .fontWeight(Font.Weight.black)
                .foregroundColor(Color.green)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
