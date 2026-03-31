//
//  AppMultiSelectionModel.swift
//  FormBuilder
//
//  Created by Bhavesh Chaudhari on 31/03/26.
//
import SwiftUI

@Observable
class AppMultiSelectionModel: FormFieldModelType {
    let id: UUID
    var value: Set<UUID>
    let items: [DemoItem]

    init(id: UUID = UUID(), items: [DemoItem], value: Set<UUID>? = nil) {
        self.id = id
        self.items = items
        self.value = value ?? []
    }
    
    func getView() -> some View {
        MultiSelectionList(items: items, selectedIDs:  Binding(
            get: { self.value },
            set: { self.value = $0 }
        )).frame(maxWidth: .infinity)
    }
}
