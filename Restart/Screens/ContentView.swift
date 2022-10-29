//
//  ContentView.swift
//  Restart
//
//  Created by Roman Laptev on 26.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var onboardingViewActive = true
    
    var body: some View {
        ZStack {
            if onboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
