//
//  WhopApp.swift
//  Whop
//
//  Created by Eric Chang on 6/3/24.
//

import SwiftUI

@main
struct WhopApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(interactor: ContentInteractor()))
        }
    }
}
