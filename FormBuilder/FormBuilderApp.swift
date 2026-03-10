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
                viewModel: AppFormViewModel(sections: []),
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
}
