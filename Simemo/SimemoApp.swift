//
//  SimemoApp.swift
//  Simemo
//
//  Created by Apprenant 31 on 28/10/2026.
//

import SwiftUI


@main
struct SimemoApp: App {
    @State private var isModalOpened = true
    var body: some Scene {
        WindowGroup {
            if isModalOpened {
                Modale(isModalOpened: $isModalOpened)
            } else {
                accueil()
            }
        }
    }
}
