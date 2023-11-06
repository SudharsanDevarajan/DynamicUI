//
//  CreateOrderView.swift
//  DynamicUI
//
//  Created by htcuser on 01/11/23.
//

import SwiftUI



struct CreateOrderView: View {
    
    @StateObject var viewModel = CreateOrderViewModel()
    
    @State private var selectedSize: String = ""
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                if let element = viewModel.createOrderModel?.elements{
                    ForEach(element) { element in
                        if element.type == "column"{
                            VStack{
                                ForEach(element.children) { child in
                                    
                                    if child.type == "label" && child.label != nil{
                                        LabelView(label: child.label!)
                                        
                                    }else if child.type == "textField" && child.textField != nil{
                                        TextFieldView(textString: $viewModel.deliverTo, textFieldData: child.textField!)
                                    }else if child.type == "spacer"{
                                        if let spacer = child.space{
                                            VStack{
                                            }.frame(height: CGFloat(spacer.vSpace ?? 0))
                                        }
                                    }else if child.type == "button" && child.button != nil{
                                        VStack{
                                            Button {
                                                print("Hello")
                                            } label: {
                                                Text(child.button?.text ?? "Nil")
                                                    .foregroundStyle(Color.init(hex: child.button?.color ?? ""))
                                                    .padding(.horizontal,24)
                                                    .padding(.vertical,16)
                                                    .background(Color.init(hex: child.button?.bgColor ?? ""))
                                                    .clipShape(Capsule())
                                            }
                                        }
                                        
                                    }else if child.type == "dropDown" && child.dropDown != nil{
                                        HStack{
                                            Text("\(child.dropDown?.placeHolder ?? "Nil")")
                                            
                                            Picker("\(child.dropDown?.placeHolder ?? "Nil")", selection: $selectedSize) {
                                                if let data = child.dropDown?.listData{
                                                    ForEach(data, id: \.self) {
                                                        Text($0)
                                                    }
                                                }
                                            }.pickerStyle(.wheel)
                                        }
                                    }
                                }
                            }
                        }else if element.type == "row"{
                            
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .onAppear{
            viewModel.fetchCreateOrderUI()
        }
        
    }
    
    func constructView(with child: [CommonComponentModel]) -> some View{
        List(child) { item in
            if item.type == "label"{
                LabelView(label: item.label!)
            }
        }
    }
    
    
    func myLabelView(text: String) -> some View{
        Text(text)
            .foregroundStyle(Color.red)
    }
    
    
}

#Preview {
    CreateOrderView()
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
