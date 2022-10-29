//
//  CircleGroupView.swift
//  Restart
//
//  Created by Roman Laptev on 27.10.2022.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var animating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    ShapeColor.opacity(ShapeOpacity),
                    lineWidth: 40
                )
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(
                    ShapeColor.opacity(ShapeOpacity),
                lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: animating ? 0 : 10)
        .opacity(animating ? 1 : 0)
        .scaleEffect(animating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: animating)
        .onAppear {
            animating = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
            CircleGroupView(
                ShapeColor: Color.white,
                ShapeOpacity: 0.2
            )
        }
    }
}
