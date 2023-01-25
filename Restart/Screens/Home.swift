//
//  Home.swift
//  Restart
//
//  Created by Murillo R. Araújo on 11/01/23.
//

import SwiftUI

struct Home: View {
    @AppStorage("onboarding") var isOnboardingActive = false
    @State private var isAnimating = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            ZStack {
                CircleGroup(color: .gray, opacity: 0.1)

                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeOut(duration: 4)
                            .repeatForever()
                        ,value: isAnimating
                    )
            }

            Text("The time that leads to mastery is dependent on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()

            Button {
                withAnimation {
                    isOnboardingActive = true
                }
            } label: {
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
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
