//
//  FormModelType.swift
//  FormBuilder
//
//  Created by Bhavesh Chaudhari on 10/03/26.
//

import SwiftUI

protocol FormFieldModelType: AnyObject, Identifiable {
    associatedtype Value
    associatedtype Content: View
    var id: UUID { get }
    var value: Value { get set }
    func getView() -> Content
}
