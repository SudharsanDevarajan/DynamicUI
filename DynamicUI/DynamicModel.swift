//
//  SpaceModel.swift
//  DynamicUI
//
//  Created by sdevar21 on 31/10/23.
//

import SwiftUI

struct DynamicModel: Codable, Identifiable{
    var id: String = UUID().uuidString
    let screenName: String
    let elements: [Elements]
}

struct Elements: Codable, Identifiable{
    var id: String = UUID().uuidString
    let type: String
    let children: [CommonComponentModel]
}

enum ElementType: Codable{
    case row
    case column
}

struct CommonComponentModel: Codable, Identifiable{
    
    var id: String?
    
    let type: String?
    
    let label: LabelModel?
    
    let textField: TextFieldModel?
    
    let dropDown: DropDownModel?
    
    let image: ImageModel?
    
    let button: ButtonModel?
    
    let space: SpacerModel?
    
    let customComponent: [CommonComponentModel]?
}

enum ComponentType: Codable{
    case label
    case image
    case textField
    case button
    case dropDown
    case spacer
    case packageSize
}

struct LabelModel: Codable{
    let text: String?
    let color: String?
    let size: Int?
    let alignment: String?
    let padding: String?
}

struct TextFieldModel: Codable{
    let color: String?
    let size: Int?
    let placeHolder: String?
    let placeHolderColor: String?
    let isRequired: Bool?
    let regex: String?
    let maxLength: Int?
    let keypadType: String?
    let padding: String?
}

struct DropDownModel: Codable{
    let color: String?
    let size: Int?
    let placeHolder: String?
    let placeHolderColor: String?
    let isRequired: Bool?
    let regex: String?
    let maxLength: Int?
    let keypadType: String?
    let padding: String?
    let listData: [String]?
}

struct ButtonModel: Codable{
    let text: String?
    let color: String?
    let bgColor: String?
    let size: Int?
    let alignment: String?
    let borderWidth: Int?
    let borderColor: String?
    let action: String?
}

struct ImageModel: Codable{
    let url: String?
    let name: String?
    let desc: String?
    let height: Int?
    let width: Int?
}

struct PackageSizeModel: Codable{
    let button: ButtonModel?
    let label: LabelModel?
    let image: ImageModel?
}

struct Padding: Codable{
    let left: Int
    let right: Int
    let bottom: Int
    let top: Int
}

struct SpacerModel: Codable{
    let vSpace: Int?
    let hSpace: Int?
}

enum KeypadType: Codable{
    case numeric
    case email
    case text
}

enum CustomComponents: String{
    case packageSize
}


