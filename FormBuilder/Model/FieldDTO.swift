//
//  FieldDTO.swift
//  FormBuilder
//
//  Created by Bhavesh Chaudhari on 10/03/26.
//

struct FormResponse: Decodable {
    let sections: [SectionDTO]
}

struct SectionDTO: Decodable {
    let title: String
    let fields: [FieldDTO]
}

struct FieldDTO: Decodable {
    let type: String
    let placeholder: String?
    let items: [ItemDTO]?
}

struct ItemDTO: Decodable {
    let id: String
    let title: String
}
