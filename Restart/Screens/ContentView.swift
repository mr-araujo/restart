//
//  ContentView.swift
//  Restart
//
//  Created by Murillo R. Araújo on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingActive = true

    var body: some View {
        ZStack {
            if isOnboardingActive {
                Onboarding()
            } else {
                Home()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
