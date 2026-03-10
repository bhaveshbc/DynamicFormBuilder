//
//  FormBuilder.swift
//  FormBuilder
//
//  Created by Bhavesh Chaudhari on 10/03/26.
//

import Foundation

protocol FormFieldBuilder {
    static var type: String { get }
    static func build(from dto: FieldDTO) -> any FormFieldModelType
}

class AppTextFieldBuilder: FormFieldBuilder {

    static let type = "text"

    static func build(from dto: FieldDTO) -> any FormFieldModelType {
        AppTextFieldModel(
            placeholder: dto.placeholder ?? ""
        )
    }
}

class AppSingleSelectionBuilder: FormFieldBuilder {

    static let type = "singleSelection"

    static func build(from dto: FieldDTO) -> any FormFieldModelType {

        let items = dto.items?.map {
            DemoItem(
                id: UUID(uuidString: $0.id) ?? UUID(),
                name: $0.title
            )
        } ?? []

        return AppSingleSelectionModel(items: items)
    }
}

struct FieldFactory {

    private let builders: [String: FormFieldBuilder.Type]

    init(builders: [FormFieldBuilder.Type]) {
        var map: [String: FormFieldBuilder.Type] = [:]

        builders.forEach {
            map[$0.type] = $0
        }

        self.builders = map
    }

    func buildField(from dto: FieldDTO) -> (any FormFieldModelType)? {
        builders[dto.type]?.build(from: dto)
    }
}
