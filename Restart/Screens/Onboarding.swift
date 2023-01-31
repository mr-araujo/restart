//
//  Onboarding.swift
//  Restart
//
//  Created by Murillo R. Araújo on 11/01/23.
//

import SwiftUI

struct Onboarding: View {
    @AppStorage("onboarding") var isOnboardingActive = true

    @State private var buttonWidth = UIScreen.main.bounds.width - 80
    @State private var buttonOffSet = CGFloat(0)
    @State private var isAnimating = false
    @State private var imageOffSet: CGSize = .zero
    @State private var arrowOpacity = 1.0
    @State private var textTitle = "Share."

    private let hapticFeedback = UINotificationFeedbackGenerator()

    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all)

            VStack(spacing: 20) {
                Spacer()

                VStack(spacing: 0) {
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle)

                    Text("It's not how much we give but")
                    Text("how much love we put into giving")

                }
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)

                ZStack {
                    CircleGroup(color: .white, opacity: 0.2)
                        .offset(x: imageOffSet.width * -1)
                        .blur(radius: abs(imageOffSet.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffSet)

                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 1), value: isAnimating)
                        .offset(x: imageOffSet.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffSet.width / 15)))
                        .animation(.easeOut(duration: 1), value: imageOffSet)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if abs(imageOffSet.width) <= 150 {
                                        imageOffSet = gesture.translation
                                    }

                                    withAnimation(.linear(duration: 0.25)) {
                                        arrowOpacity = 0
                                        textTitle = "Give."
                                    }
                                }
                                .onEnded { _ in
                                    imageOffSet = .zero

                                    withAnimation(.linear(duration: 0.25)) {
                                        arrowOpacity = 1
                                        textTitle = "Share."
                                    }
                                }
                        )
                }
                .overlay (
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(arrowOpacity)
                    , alignment: .bottom
                )

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
                            .frame(width: buttonOffSet + 80)

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
                        .offset(x: buttonOffSet)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffSet <= buttonWidth - 75  {
                                        buttonOffSet = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(Animation.easeOut(duration: 1)) {
                                        if buttonOffSet > buttonWidth / 2 {
                                            hapticFeedback.notificationOccurred(.success)
//                                            playSound(sound: "chimeup", type: "mp3")
                                            buttonOffSet = buttonWidth - 80
                                            isOnboardingActive = false
                                        } else {
                                            hapticFeedback.notificationOccurred(.warning)
                                            buttonOffSet = 0
                                        }
                                    }
                                }
                        )
                        Spacer()
                    }
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }
        }
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
