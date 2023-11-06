//
//  TextFieldView.swift
//  DynamicUI
//
//  Created by htcuser on 02/11/23.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var textString: String
    var textFieldData: TextFieldModel
    
    var body: some View {
        TextField(textFieldData.placeHolder ?? "Nil", text: $textString)
    }
}
