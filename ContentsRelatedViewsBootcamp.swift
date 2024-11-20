//
//  ContentsRelatedViewsBootcamp.swift
//  SwiftUiBootcamp
//
//  Created by TabYang on 20/11/2024.
//

import SwiftUI

struct ContentsRelatedViewsBootcamp: View {
    let rule = [GridItem(.adaptive(minimum: 200, maximum: 350), spacing: 15, alignment: .center)]
    var array: Array<Row> = [
        Row(label: "用时", image:"clock", value: "50", unit: "分钟"),
        Row(label: "当前项目", image: "circles.hexagonpath.fill", value: "3", unit: "个"),
        Row(label: "获得成就", image: "star.fill", value: "5", unit: "枚")
    ]
    
    @State var showTargetOnMainScreen: Bool = false
    @State var sendNotification: Bool = false
    @State private var selectedDuration = 0
    
    var targetDurations = ["15mins", "20mins", "12mins", "10mins"]
    
    var body: some View {
        TabView {
            VStack {
                List {
                    CardView
                    CardView
                    CardView
                    CardView
                    CardView
                }
            }
            .tabItem() {
                Image(systemName: "globe")
                Text("Home")
            }
            
            NavigationView {
                NavigationLink(destination: HierarchyRelatedViewBootcamp()) {
                    ScrollView {
                        LazyVGrid(columns: rule, spacing: 8) {
                            ForEach(array) {
                                row in
                                GroupBox(label: Label(row.label, systemImage: row.image)) {
                                    ValueView(value: row.value, unit: row.unit)
                                }
                            }
                        }
                    }
                }
            }.navigationTitle("统计")
                .tabItem {
                    Image(systemName: "textformat.123")
                    Text("统计")
                }
            
            NavigationView {
                Form {
                    Section(header: Text("每日目标")) {
                        Toggle(isOn: $showTargetOnMainScreen) {
                            Text("显示目标")
                        }
                        
                        Toggle(isOn: $sendNotification) {
                            Text("推送提醒")
                        }
                        
                        Picker(selection: $selectedDuration, label: Text("目标时长")) {
                            ForEach(0..<targetDurations.count) {
                                Text(self.targetDurations[$0])
                            }
                        }
                    }
                    
                    Section(header: Text("帮助与反馈")) {
                        Button(action: { }) {
                            Text("帮助指南")
                        }
                        Button(action: { }) {
                            Text("提交反馈")
                        }
                    }
                }
            }
            .navigationTitle("设置")
            .tabItem {
                Image(systemName: "gearshape")
                Text("设置")
            }
            
        }
        
    }
}

struct ValueView: View {
    var value: String
    var unit: String
    var size: CGFloat = 1
    
    var body: some View {
        HStack {
            Text(value).font(.system(size: 24 * size, weight: .bold, design: .rounded)).foregroundColor(.secondary)
            Spacer()
        }
    }
}
struct Row: Identifiable, Hashable {
        var id = UUID()
        var label: String
        var image: String
        var value: String
        var unit: String
    }

#Preview {
    ContentsRelatedViewsBootcamp()
}
