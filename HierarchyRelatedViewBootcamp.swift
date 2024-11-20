//
//  HierarchyRelatedViewBootcamp.swift
//  SwiftUiBootcamp
//
//  Created by TabYang on 19/11/2024.
//

import SwiftUI

struct HierarchyRelatedViewBootcamp: View {
    
    @State var showModal = false
    @State var showActionSheet = false
    @State var showAlert = false
    @State var showAlert2 = false
    
    var body: some View {
        TabView {
            ScrollView(.vertical, showsIndicators: false) {
                Circle()
                    .padding()
                Circle()
                    .padding()
                Circle()
                    .padding()
                Circle()
                    .padding()
            }
            .tabItem {
                Image(systemName: "scroll")
                Text("Scroll")
            }
            .foregroundColor(.blue)
            
            NavigationView {
                VStack {
                        NavigationLink(destination: ControlViewBootcamp()) {
                            CardView
                        }
                }
                .navigationTitle("项目列表")
            }
            .tabItem {
                Image(systemName: "network")
                Text("Navigation")
            }
            
            VStack(spacing: 50) {
                Button(action: {
                    showModal.toggle()
                }) {
                    Text("显示长弹窗")
                        .font(.headline)
                        .frame(width: 200)
                        .cardStyle()
                }
                .sheet(isPresented: $showModal) {
                    BasicViewsBootcamp()
                }
                
                Button(action: {
                    showActionSheet.toggle()
                }) {
                    Text("显示行动列表")
                        .font(.headline)
                        .frame(width: 200)
                        .cardStyle()
                }
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(title: Text("要执行什么操作"), message: Text("此操作可能存在风险!"), buttons: [
                        .default(Text("添加至收藏夹")) { },
                        .destructive(Text("删除")) { },
                        .cancel()
                    ])
                }
            }
            .tabItem {
                Image(systemName: "square.stack")
                Text("Modal")
            }
            
            VStack(spacing: 50) {
                Button(action: {
                    showAlert.toggle()
                }) {
                    Text("可选择警告窗口")
                        .font(.headline)
                        .frame(width: 200)
                        .cardStyle()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("警告"), message: Text("此操作存在风险"),
                          primaryButton: .destructive(Text("删除")),
                          secondaryButton: .default(Text("取消")))
                }
                
                Button(action: {
                    showAlert2.toggle()
                }) {
                    Text("仅警告窗口")
                        .font(.headline)
                        .frame(width: 200)
                        .cardStyle()
                }
                .alert(isPresented: $showAlert2) {
                    Alert(title: Text("提示"), message: Text("此操作用时较长！"), dismissButton: .default(Text("我已知晓")))
                }
            }
            .tabItem {
                Image(systemName: "exclamationmark.triangle")
                Text("Alert")
            }
            
        }
    }
}

var CardView: some View {
    VStack {
        VStack(spacing: 30) {
            HStack {
                Image(systemName: "globe")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                
                VStack(alignment: .leading) {
                    Text("独立开发指南")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 5)
                    
                    Text("让你的创作变现变得更简单！")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Spacer()
                        Image(systemName: "arrowshape.turn.up.right")
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                .padding(.leading)
            }
            .frame(maxHeight: 120)
            .cardStyle()
        }
        
    }
}

#Preview {
    HierarchyRelatedViewBootcamp()
}
