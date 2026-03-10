//
//  AppSingleSelectionModel.swift
//  FormBuilder
//
//  Created by Bhavesh Chaudhari on 10/03/26.
//

import SwiftUI

@Observable
class AppSingleSelectionModel: FormFieldModelType {
    let id: UUID
    var value: UUID?
    let items: [DemoItem]

    init(id: UUID = UUID(), items: [DemoItem], value: UUID? = nil) {
        self.id = id
        self.items = items
        self.value = value
    }
    
    func getView() -> some View {
        SingleSelectionList(
            items: self.items,
            selectedID: Binding(
                get: { self.value },
                set: { self.value = $0 }
            )
        ).frame(maxWidth: .infinity)
    }
}
