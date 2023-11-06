//
//  DropdownView.swift
//  DynamicUI
//
//  Created by htcuser on 06/11/23.
//

import SwiftUI

struct DropdownView: View {
    
    var dropDownModel: DropDownModel
    
    var body: some View {
        VStack{
            if let data = dropDownModel.listData{
                List(data, id: \.self) { item in
                    Text("\(item)")
                }
            }
            
        }
        
    }
}
