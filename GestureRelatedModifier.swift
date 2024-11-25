//
//  GestureRelatedModifier.swift
//  SwiftUiBootcamp
//
//  Created by TabYang on 25/11/2024.
//

import SwiftUI

struct GestureRelatedModifier: View {@State var currentGesture = "无"
    @State var longPressed: Bool = false
    var imageNames = ["hare", "tortoise", "cloud", "moon", "wind"]
    @State var currentImageName = "questionmark"
    @GestureState var magnifyBy = CGFloat(1.0)
    
    @State var angle = Angle(degrees: 1.0)
    @State var isDragging = false
    var rotation: some Gesture {
        RotationGesture()
            .onChanged() {
                angle in self.angle = angle
                currentGesture = "放大"
            }
    }
    
    var magnificaiton: some Gesture {
        MagnificationGesture()
            .updating($magnifyBy) {
                currentState, gestureState, transaction in gestureState = currentState
                currentGesture = "旋转"
            }
    }
    
    var dragging: some Gesture {
        DragGesture()
            .onChanged() {_ in isDragging = true
                currentGesture = "拖拽"
            }
            .onEnded() {_ in isDragging = false
                currentGesture = "拖拽"}
            
    }
    
    var body: some View {
        Text("当前手势：\(currentGesture)")
            .font(.largeTitle)
            .bold()
        
        HStack {
            RoundedRectangle(cornerRadius: 25.0)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(longPressed ? .orange : .blue)
                .onLongPressGesture() {
                    currentGesture = "长按"
                    longPressed.toggle()
                }
            
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                
                Image(systemName: currentImageName)
                    .scaleEffect(4)
                    .scaledToFit()
                    .onTapGesture {
                        currentImageName = imageNames.randomElement()!
                        currentGesture = "点按"
                    }
            }
        }
        
        HStack {
            RoundedRectangle(cornerRadius: 25.0)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200 * magnifyBy, height: 200 * magnifyBy)
            
            RoundedRectangle(cornerRadius: 25.0)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200 * magnifyBy, height: 200 * magnifyBy)
                .gesture(rotation)
        }
        
        HStack {
            RoundedRectangle(cornerRadius: 25.0)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200 * magnifyBy, height: 200 * magnifyBy)
                .foregroundColor(isDragging ? .orange : .blue)
                .gesture(dragging)
        }
    }
}

#Preview {
    GestureRelatedModifier()
}
