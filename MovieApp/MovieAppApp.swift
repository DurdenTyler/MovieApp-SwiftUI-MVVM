//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Ivan White on 27.05.2022.
//

import SwiftUI

let screen = UIScreen.main.bounds
let safeArea = UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

@main
struct MovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            AppView()
        }
    }
}
