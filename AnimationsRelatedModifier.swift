//
//  AnimationsRelatedModifier.swift
//  SwiftUiBootcamp
//
//  Created by TabYang on 25/11/2024.
//

import SwiftUI

struct AnimationsRelatedModifier: View {
    
    @State var showAnimation: Bool = false
    @State var playTransition: Bool = false
    @State var isPlaying: Bool = false
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        
        VStack {
            VStack {
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)){
                        self.showAnimation.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showAnimation ? 90 : 0))
                        .scaleEffect(showAnimation ? 0.4 : 5)
                        .padding()
                    //                .animation(.default)
                }
                .padding()
                
                if playTransition {
                    Image(systemName: "globe")
                        .resizable()
                        .transition(.asymmetric(insertion: .slide, removal: .scale))
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                
                Button(action: {
                    playTransition.toggle()
                }) {
                    Text("Image")
                }
            }
            .padding()
            
            HStack {
                Group {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {isPlaying.toggle()}
                    }) {
                        if isPlaying {
                            Image(systemName: "pause.fill")
                                .imageScale(.large)
                                .transition(.scale)
                                .transition(.opacity)
                        } else {
                            Image(systemName: "play.fill")
                                .imageScale(.large)
                                .transition(.scale)
                                .transition(.opacity)
                        }
                    }
                }
                .padding()
                
                Group {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 6)
                            .frame(width: 90, height: 90, alignment: .center)
                            .foregroundColor(Color(.systemGray))
                        Rectangle()
                            .frame(width: 24, height: 24, alignment: .center)
                            .foregroundColor(Color(.orange))
                            .cornerRadius(2)
                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                            .frame(width: 90, height: 90)
                            .foregroundColor(Color(.orange))
//                            .rotationEffect(.degrees(-90))
                            .animation(Animation.easeInOut.speed(0.25))
                            .onAppear() {
                                self.progress = 1
                            }
                    }
                }
            }
        }
        
    }
}


#Preview {
    AnimationsRelatedModifier()
}
