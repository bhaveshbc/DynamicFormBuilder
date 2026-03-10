
//  AppTextField.swift
//  FormBuilder
//
//  Created by Bhavesh Chaudhari on 25/02/26.
//

import SwiftUI
public struct AppTextField: View {
    
    @Binding private var text: String
    private let placeholder: String
    
    public init(
        _ placeholder: String,
        text: Binding<String>,
    ) {
        self._text = text
        self.placeholder = placeholder
    }

    public var body: some View {
        CardShadow {
            TextField(placeholder, text: $text)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
        }
    }
}

#Preview("AppTextField Variants") {
    @Previewable @State var text1: String = ""
 

     VStack(spacing: 20) {
        AppTextField("Placeholder", text: $text1)

    }
    .padding()
   
}


