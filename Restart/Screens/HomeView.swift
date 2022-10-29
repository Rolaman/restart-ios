//
//  HomeView.swift
//  Restart
//
//  Created by Roman Laptev on 26.10.2022.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var onboardingViewActive = false
    @State private var animating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: animating ? 35 : -35)
                .animation(
                    .easeInOut(duration: 4)
                    .repeatForever(),
                value: animating)
            }
            
            Text("The time that leads to mastery is dependent on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            Button(action: {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    onboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                animating = true
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
