//
//  Home.swift
//  Restart
//
//  Created by Murillo R. Araújo on 11/01/23.
//

import SwiftUI

struct Home: View {
    @AppStorage("onboarding") var isOnboardingActive = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Home").font(.largeTitle)

            Button("Restart") {
                isOnboardingActive = true
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
