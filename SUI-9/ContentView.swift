//
//  ContentView.swift
//  SUI-9
//
//  Created by  Pavel Nepogodin on 23.10.23.
//

import SwiftUI

struct ContentView: View {
    @State var position: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
            Canvas { context, size in
                
                context.addFilter(.alphaThreshold(min: 0.1, color: .white))
                context.addFilter(.blur(radius: 30))
                context.drawLayer { ctx in
                    for index in [1,2] {
                        if let shape = context.resolveSymbol(id: index) {
                            ctx.draw(shape, at: CGPoint(
                                x: size.width / 2,
                                y: size.height / 2
                            ))
                        }
                    }
                }
            } symbols: {
                Circle()
                    .fill(.white)
                    .frame(width: 100, height: 100)
                    .tag(1)
                
                Circle()
                    .fill(.white)
                    .frame(width: 100, height: 100)
                    .tag(2)
                    .offset(position)
                    .animation(.interpolatingSpring(stiffness: 150, damping: 15), value: position)
            }
            .background(.blue)
            .frame(width: geometry.size.width, height: geometry.size.height - 1)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        position = value.translation
                    }).onEnded({ _ in
                        position = .zero
                    })
            )
        }.edgesIgnoringSafeArea(.top)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

