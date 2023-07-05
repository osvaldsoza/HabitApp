//
//  HabitApp.swift
//  Habit
//
//  Created by osvaldo ferreira on 04/07/23.
//

import SwiftUI

@main struct HabitApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
