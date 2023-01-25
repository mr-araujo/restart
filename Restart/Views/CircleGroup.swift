//
//  CircleGroup.swift
//  Restart
//
//  Created by Murillo R. Araújo on 23/01/23.
//

import SwiftUI

struct CircleGroup: View {
    @State var color: Color
    @State var opacity: Double
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(opacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)

            Circle()
                .stroke(color.opacity(opacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear() {
            isAnimating = true
        }
    }
}

struct CircleGroup_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()

            CircleGroup(color: .white, opacity: 0.2)
        }
    }
}
