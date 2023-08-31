//
//  Art_GeneratorApp.swift
//  Art Generator
//
//  Created by Alex Bussan on 8/31/23.
//

import SwiftUI

@main
struct AppEntry: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    Task {
                        let sample = GenerationInput(prompt: "Two joyous dwarves wearing japanese streetwear, mining the heart of a mountain in a dark fantasy style")
                        if let data = sample.encodedData {
                            try await APIService().fetchImages(with: data)
                        }
                    }
                }
        }
    }
}
