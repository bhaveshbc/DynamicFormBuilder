//
//  AppFormViewModel.swift
//  FormBuilder
//
//  Created by Bhavesh Chaudhari on 10/03/26.
//

import SwiftUI

@Observable
class AppFormViewModel {
    
    var sections: [any FormSectionModelType] = []
    
    init(sections: [any FormSectionModelType] = []) {
        let formAFactory = FieldFactory(
            builders: [
                AppTextFieldBuilder.self,
                AppSingleSelectionBuilder.self,
                AppMultiSelectionBuilder.self,
                AppTextAreaFieldBuilder.self
            ]
        )
        self.sections = buildFromAPI(factory: formAFactory)
    }
    
    func buildFromAPI(factory: FieldFactory) -> [AppTextSection] {

        guard let url = Bundle.main.url(forResource: "form", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let response = try? JSONDecoder().decode(FormResponse.self, from: data)
        else { return [] }

        return response.sections.map { sectionDTO in

            let fields = sectionDTO.fields.compactMap {
                factory.buildField(from: $0)
            }

            return AppTextSection(
                value: sectionDTO.title,
                fields: fields
            )
        }
    }
    
    func printFormData() {
        for field in sections  {
            for model in field.fields {
                print(model.value)
            }
        }
    }
}
