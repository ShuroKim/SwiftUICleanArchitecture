//
//  ContentView.swift
//  SwiftUICleanArchitecture
//
//  Created by Shuraw on 3/27/24.
//

import SwiftUI

struct ContentView: View {
    private let container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView(container: .preview)
}
