//
//  SplashViewModel.swift
//  Habit
//
//  Created by osvaldo ferreira on 04/07/23.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear(){
      
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
          //  self.uiState = .goToHomeScreen;
            self.uiState = .goToSignInScreen
        }
    }
}
