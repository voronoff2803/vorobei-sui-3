//
//  ContentView.swift
//  vorobei-sui-3
//
//  Created by Alexey Voronov on 07.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animation: CGFloat = 0.0
    var animationDuration: Double = 0.5
    
    var body: some View {
        ZStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack {
                    Image(systemName: "arrowtriangle.right.fill")
                        .padding(-8)
                        .scaleEffect(animation)
                        .offset(CGSize(width: 18.0 * animation + 9, height: 0))
                        .opacity(animation)
                        
                    Image(systemName: "arrowtriangle.right.fill")
                        .padding(-8)
                        .offset(CGSize(width: 27.0 * animation, height: 0))
                    Image(systemName: "arrowtriangle.right.fill")
                        .padding(-8)
                        .scaleEffect(1.0 - animation)
                        .offset(CGSize(width: 18.0 * animation, height: 0))
                        .opacity(1.0 - animation)
                }
                .font(.largeTitle)
                .foregroundColor(.blue)
                .onTapGesture {
                    withAnimation(.interpolatingSpring(stiffness: 300, damping: 15)) {
                        animation = 1.0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        animation = 0.0
                    }
                }
            })
            .allowsHitTesting(animation == 0.0)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
