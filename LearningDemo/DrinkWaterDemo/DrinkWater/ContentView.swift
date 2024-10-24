//
//  ContentView.swift
//  DrinkWater
//
//  Created by TabYang on 24/10/2024.
//

import SwiftUI

struct DrinkWater: View {
    @State var isWatered: Bool = false
    var body: some View {
        VStack{
            ZStack{
                Image("Background")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                Image(systemName: isWatered ? "crown.fill" : "eyes.inverse")
                    .foregroundColor(isWatered ? .blue : .yellow)
                    .font(.system(size: 120))
            }
            .frame(minHeight: 600)
            .shadow(radius: 10)
            
            Divider()
            
            Toggle(isOn: $isWatered){
                Label("你喝水了嘛? ", systemImage: "drop.fill")
            }
            .foregroundColor(.blue)
        }.padding()
    }
}

#Preview {
    DrinkWater()
}
