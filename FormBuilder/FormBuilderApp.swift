//
//  FormBuilderApp.swift
//  FormBuilder
//
//  Created by Bhavesh Chaudhari on 25/02/26.
//

import SwiftUI

@main
struct FormBuilderApp: App {
    var body: some Scene {
        WindowGroup {
            AppFormView(
                viewModel: AppFormViewModel(sections: buildFromAPI()),
                config: DynamicFormConfig {
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                }
            )
        }
    }
    
    func buildFromAPI() -> [AppTextSection] {
         let sampleItems: [DemoItem] = [
             .init(id: UUID(), name: "Option A"),
             .init(id: UUID(), name: "Option B"),
             .init(id: UUID(), name: "Option C")
         ]

         return [
            AppTextSection(
                value: "Personal Info",
                 fields: [
                    AppTextFieldModel(placeholder: "First Name"),
                    AppTextFieldModel(placeholder: "Last Name"),
                    AppTextFieldModel(placeholder: "Email")
                 ]
             ),
            AppTextSection(
                value: "Preferences",
                 fields: [
                    AppSingleSelectionModel(items: sampleItems)
                 ]
             ),
            
               AppTextSection(
                   value: "Personal Info",
                    fields: [
                       AppTextFieldModel(placeholder: "First Name"),
                       AppTextFieldModel(placeholder: "Last Name"),
                       AppTextFieldModel(placeholder: "Email")
                    ]
                ),
               AppTextSection(
                   value: "Preferences",
                    fields: [
                       AppSingleSelectionModel(items: sampleItems)
                    ]
                )
,
            
               AppTextSection(
                   value: "Personal Info",
                    fields: [
                       AppTextFieldModel(placeholder: "First Name"),
                       AppTextFieldModel(placeholder: "Last Name"),
                       AppTextFieldModel(placeholder: "Email")
                    ]
                ),
               AppTextSection(
                   value: "Preferences",
                    fields: [
                       AppSingleSelectionModel(items: sampleItems)
                    ]
                )

         ]
     }
}
