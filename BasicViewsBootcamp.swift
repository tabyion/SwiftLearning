//
//  BasicViewsBootcamp.swift
//  SwiftUiBootcamp
//
//  Created by TabYang on 18/11/2024.
//

import SwiftUI

struct BasicViewsBootcamp: View {
    var body: some View {
        
        @State var textField = ""
        @State var secureField = ""
        @State var textEditor = "Text Editor: MultipleLines"
        
        VStack {
            VStack(alignment: .center, spacing: 50.0) {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .padding()
                
                Label("Hello", systemImage: "square.stack")
                
                TextField("Please type your word here", text: $textField)
                    .padding()
                    .frame(width: 250, height: 40, alignment: .center)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Your password", text: $secureField)
                    .padding()
                    .frame(width: 250, height: 40, alignment: .center)
                    .textFieldStyle(.roundedBorder)
                
                Link("Link", destination: URL(string: "https://bing.cn")!)
                    .padding()
                    .italic()
                
                TextEditor(text: $textEditor)
                    .padding()
                    .frame(width: 300, height: 100, alignment: .center)
            }
            .padding()
            
            ZStack {
                HStack {
                    Rectangle()
                        .frame(width: 40, height: 40, alignment: .leading)
                        .padding()
                        .foregroundColor(.red)
                    
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .frame(width: 40, height: 40, alignment: .leading)
                        .padding()
                        .foregroundColor(.yellow)
                    
                    Circle()
                        .frame(width: 40, height: 40, alignment: .leading)
                        .padding()
                        .foregroundColor(.green)
                    
                    Ellipse()
                        .frame(width: 40, height: 60, alignment: .leading)
                        .foregroundColor(.blue)
                        .padding()
                    
                    Capsule()
                        .frame(width: 40, height: 60, alignment: .leading)
                        .padding()
                        .foregroundColor(.purple)
                }
                .padding()
            }
            .background(.white)
            .shadow(color: .gray, radius: 2, x: 1, y: 1)
            .padding()
        }

    }
}

#Preview {
    BasicViewsBootcamp()
}
