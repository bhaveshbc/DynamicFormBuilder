//
//  ShadowView.swift
//  FormBuilder
//
//  Created by Bhavesh Chaudhari on 10/03/26.
//
import SwiftUI

struct CardShadow<Content: View>: View {
    let content: Content
    var cornerRadius: CGFloat = 12
    
    init(cornerRadius: CGFloat = 12, @ViewBuilder content: () -> Content) {
        self.cornerRadius = cornerRadius
        self.content = content()
    }
    
    var body: some View {
        content
        .background(
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 0)
            
            )
        .padding(5)
        .cornerRadius(cornerRadius)
            
    }
}
