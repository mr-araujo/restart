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
        VStack(spacing: 20) {
            Text("Onboarding").font(.largeTitle)

            Button("Start") {
                isOnboardingActive = false
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
