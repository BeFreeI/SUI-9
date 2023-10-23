//
//  AlternativeContentView.swift
//  SUI-9
//
//  Created by  Pavel Nepogodin on 24.10.23.
//

import SwiftUI

struct AlternativeContentView: View {
    @State var position: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Circle()
                    .frame(width: 100, height: 100)
                    .position(
                        x: geometry.size.width / 2,
                        y: geometry.size.height / 2
                    )
                
                Circle()
                    .frame(width: 100, height: 100)
                    .position(
                        x: geometry.size.width / 2,
                        y: geometry.size.height / 2
                    )
                    .offset(position)
                    .animation(.interpolatingSpring(
                        stiffness: 150,
                        damping: 15
                    ), value: position)
            }
            .blur(radius: 15)
            .overlay {
                blendableShape(shape: Rectangle())
            }
            .edgesIgnoringSafeArea(.top)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        position = value.translation
                    }).onEnded({ _ in
                        position = .zero
                    })
            )
        }
    }
}

struct blendableShape<Shape: View>: View {
    let shape: Shape
    
    var body: some View {
        shape
            .foregroundColor(.white)
            .blendMode(.difference)
            .overlay(shape.blendMode(.hue))
            .overlay(shape.foregroundColor(.white).blendMode(.overlay))
            .overlay(shape.foregroundColor(.black).blendMode(.overlay))
            .overlay(shape.foregroundColor(.black).blendMode(.overlay))
            .overlay(shape.foregroundColor(.black).blendMode(.overlay))
            .overlay(shape.foregroundColor(.black).blendMode(.overlay))
    }
}

struct AlternativeContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlternativeContentView()
    }
}
