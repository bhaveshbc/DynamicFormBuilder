//
//  AppTextSection.swift
//  FormBuilder
//
//  Created by Bhavesh Chaudhari on 25/02/26.
//
import Foundation
import SwiftUI

@Observable
class AppTextSection: FormSectionModelType {
    
    let id: UUID = UUID()
    var value: String
    var fields: [any FormFieldModelType]
    
    init(value: String, fields: [any FormFieldModelType] = []) {
        self.value = value
        self.fields = fields
    }
    
    func getView() -> some View {
        Text(value)
            .font(.headline)
            .textCase(nil)
            .foregroundStyle(Color.black)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .init(horizontal: .center, vertical: .center)
            )
    }
   
}









