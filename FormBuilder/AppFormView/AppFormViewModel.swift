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
        self.sections = sections
    }
    
    func printFormData() {
        for field in sections  {
            for model in field.fields {
                print(model.value)
            }
        }
    }
}
