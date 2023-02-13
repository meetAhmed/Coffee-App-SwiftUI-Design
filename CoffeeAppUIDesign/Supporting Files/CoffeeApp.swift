//
//  CoffeeAppUIDesignApp.swift
//  CoffeeApp
//
//  Created by Ahmed Ali on 30/01/2023.
//

import SwiftUI

@main
struct CoffeeApp: App {
    @StateObject var viewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            IntroView()
                .environmentObject(viewModel)
        }
    }
}
