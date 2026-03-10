//
//  AppTextFieldModel.swift
//  FormBuilder
//
//  Created by Bhavesh Chaudhari on 10/03/26.
//

import SwiftUI

@Observable
class AppTextFieldModel: FormFieldModelType {
    
    let id: UUID
    var value: String
    let placeholder: String
    
    init(id: UUID = UUID(), placeholder: String, value: String = "") {
        self.id = id
        self.placeholder = placeholder
        self.value = value
    }
    
    func getView() -> some View {
        AppTextField(self.placeholder, text: Binding(
            get: { self.value },
            set: { self.value = $0 }
        ))
    }
}
