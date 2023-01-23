//
//  Onboarding.swift
//  Restart
//
//  Created by Murillo R. Araújo on 11/01/23.
//

import SwiftUI

struct Onboarding: View {
    @AppStorage("onboarding") var isOnboardingActive = true

    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all)

            VStack(spacing: 20) {
                Spacer()

                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)

                    Text("It's not how much we give but")
                    Text("how much love we put into giving")

                }
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.white)
                .padding(.horizontal, 10)

                ZStack {
                    CircleGroup(color: .white, opacity: 0.2)

                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }

                Spacer()

                ZStack {
                    Capsule()
                        .fill(.white.opacity(0.2))

                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)

                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)

                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)

                        Spacer()
                    }

                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))

                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)

                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(height: 80, alignment: .center)
                        .onTapGesture {
                            isOnboardingActive = false
                        }

                        Spacer()
                    }
                }
                .frame(height: 80, alignment: .center)
                .padding()
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
