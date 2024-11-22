//
//  ImageRelatedModifier.swift
//  SwiftUiBootcamp
//
//  Created by TabYang on 22/11/2024.
//

import SwiftUI

struct ImageRelatedModifier: View {
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .resizable()
//                .scaledToFit()
//                .scaleEffect(2.5)
//                .frame(width: 200, height: 200, alignment: .center)
//                .clipShape(Circle())
//                .shadow(radius: 10)
//                .padding()
//            
//            Image(systemName: "globe")
//                .resizable()
//                .avatarStyle()
//                .padding()
//            
//            Image(systemName: "globe")
//                .imageAvatarStyle()
//                .padding()
            
            Text("绘笔")
                .font(.largeTitle)
                .bold()
                .padding()
                .foregroundColor(.orange)
//                .background(.black)
            
            
            Image(systemName: "scribble.variable")
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                .imageScale(.large)
                .foregroundColor(.orange)
//                .background(.blue)
            
            HStack {
                Text("Connet")
                Image(systemName: "globe")
            }
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .padding()
            
            HStack {
                Text("Connet")
                Image(systemName: "globe")
            }
            .coloredButtonStyle()
            
            HStack {
                Color.red
                Color.blue
                Color.yellow
                Color.green
                Color.purple
                Color.black
                Color.gray
                Color.clear
                Color(red: 100, green: 100, blue: 0)
                
            }.frame(height: 60)
            
            VStack(alignment: .leading) {
                Text("Primary")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.primary)
                
                Text("Secondary")
                    .font(.title)
                    .bold()
                    .foregroundColor(.secondary)
            }
            
            // 扩展颜色到 HEX
            // ...
            HStack {
                let colors = Gradient(colors: [.white, .blue])
                RoundedRectangle(cornerRadius: 12)
                    .fill(LinearGradient(gradient: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(RadialGradient(gradient: colors, center: .center, startRadius: 1, endRadius: 100))
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(AngularGradient(gradient: colors, center: .center))
                    .strokeBorder(style: .init(lineWidth: 3))
            }
            .frame(height: 160)
            .padding()
            .border(Color.black, width: 3)
            .padding()
            
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.gray)
                    .frame(width: 100)
                    .rotationEffect(.degrees(16))
                    .padding()
                    .blur(radius: 3.0)
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.gray)
                    .frame(width: 100)
                    .scaleEffect(0.8)
                    .opacity(0.9)
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100)
                    .rotation3DEffect(.degrees(30), axis: (x: 0, y: 1, z: 0))

            }
            

            
        }
        
    }
}

struct AvatarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .scaleEffect(2.5)
            .frame(width: 200, height: 200, alignment: .center)
            .clipShape(Circle())
            .shadow(radius: 10)
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            
    }
}


extension View {
    func coloredButtonStyle() -> some View {
        self
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .padding()
    }
}
extension View {
    func avatarStyle() -> some View {
        self.modifier(AvatarModifier())
    }
}

extension Image {
    func imageAvatarStyle() -> some View {
        self
            .resizable()
            .avatarStyle()
    }
}

#Preview {
    ImageRelatedModifier()
}
