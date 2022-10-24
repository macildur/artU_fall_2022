//
//  ArtUApp.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 10/5/22.
//

import SwiftUI

@main
struct ArtUApp: App {
    @State var signInSuccess = false

    var body: some Scene {
        WindowGroup {
            if !signInSuccess {
                LoginView(signInSuccess: $signInSuccess) 
            } else {
                SkillView()
            }
        }
    }
}
