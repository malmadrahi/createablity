//
//  AnimatedMeshGradient.swift
//  Creatability Version 2
//
//  Created by Taijah Johnson on 12/9/25.
//

import SwiftUI

struct AnimatedMeshGradient: View {
    
    @State var appear = false
    
    var body: some View {
        
        MeshGradient(width: 3,
                     height: 3,
                     //                     points: [
                     //            .init(0, 0), .init(1, 0), .init(2, 0),
                     //            .init(0, 1), .init(1, 1), .init(2, 1),
                     //            .init(0, 2), .init(1, 2), .init(2, 2)
                     //        ],
                     
                     points: [
                        [0.0,0.0], [1.0,0.0], [2.0,0.0],
                        [0.0,1.0], appear ? [0.5,6.5] : [1.0,1.0], [2.0,2.0],
                        [0.0,2.0], [3.0,3.0], [2.0,2.0]
                     ],
                     colors: [
                        .black, .purple, .green, .green, .black, .black, .green
//                        .pink, .green, .orange,
//                        .blue, .purple, .green
                        
                     ])
        .onAppear {
            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)){
                appear.toggle()
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    AnimatedMeshGradient()
}
