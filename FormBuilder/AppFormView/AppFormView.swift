//
//  AppFormView.swift
//  FormBuilder
//
//  Created by Bhavesh Chaudhari on 10/03/26.
//

import SwiftUI

struct DynamicFormConfig<Content: View> {
    var rowInset: EdgeInsets
    var cornerRadius: CGFloat
    var backgroundContent: Content

    init(cornerRadius: CGFloat = 12, rowInset: EdgeInsets = .init(), @ViewBuilder content: () -> Content) {
        self.cornerRadius = cornerRadius
        self.rowInset = rowInset
        self.backgroundContent = content()
    }
}

struct AppFormView<Config: View>: View {
    
    @State private var viewModel: AppFormViewModel
    
    let config: DynamicFormConfig<Config>
    
    init(viewModel: AppFormViewModel = AppFormViewModel(), config: DynamicFormConfig<Config>) {
        self.viewModel = viewModel
        self.config = config
    }

    var body: some View {
        Form {
            ForEach(viewModel.sections, id: \.id) { section in
                Section(header: AnyView(section.getView())) {
                    ForEach(section.fields, id: \.id) { field in
                        AnyView(field.getView())
                            .listRowSeparator(.hidden)
                            .listRowInsets(config.rowInset)
                            .listRowBackground(Color.clear)
                    }
                }
                .listRowBackground(Color.clear)
            }

            Section {
                Button(action: { viewModel.printFormData() }) {
                    Text("Submit")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)              // removes grouped spacing
        .listSectionSpacing(0)          // removes section spacing
        .scrollContentBackground(.hidden)   // remove form background
        .background(config.backgroundContent)
    }
}
