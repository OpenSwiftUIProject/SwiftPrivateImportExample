//
//  ContentView.swift
//  Example
//
//  Created by Kyle on 2024/12/1.
//

@_private(sourceFile: "CoreColor.swift")
import SwiftUI

struct ContentView: View {
    var body: some View {
        Color.red
            .onAppear {
                print(Color.Resolved.cache)
            }
    }
}

#Preview {
    ContentView()
}
