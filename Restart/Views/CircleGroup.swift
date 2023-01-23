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

    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(opacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)

            Circle()
                .stroke(color.opacity(opacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
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
