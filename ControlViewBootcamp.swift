//
//  ControlViewBootcamp.swift
//  SwiftUiBootcamp
//
//  Created by TabYang on 19/11/2024.
//

import SwiftUI
import MapKit

struct ControlViewBootcamp: View {
    @State var toggleValue = true
    @State var pickerValue = 0
    @State var sliderValue = 0.0
    @State var stepperValue = 0
    @State var selectedDate = Date()
    @State var progressValue = 0.2
    @State var location = MKCoordinateRegion(center: .init(latitude: 39.1213, longitude: 116.2341), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -100, to: Date())!
        
        let max = Calendar.current.date(byAdding: .day, value: 100, to: Date())!
        
        return min...max
    }
    
    var pickerOptions = ["1", "2", "3"]
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Toggle")
                            .font(.headline)
                        
                        Toggle("Toggle", isOn: $toggleValue)
                            .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                    }
                    .background(Color("WhiteDarkMode"))
                    .padding()
                    .frame(height: 80)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Button")
                            .font(.headline)
                        
                        Button(action: {
                            // funciton
                        }, label: {
                            Image(systemName: "person.crop.circle.fill.badge.minus")
                                .font(.system(size: 16, weight: .bold))
                            Text("Exit")
                                .bold()
                        })
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color(.blue))
                        .cornerRadius(15)
                    }
                    .frame(height: 80)
                    .padding()
                    .background(Color("WhiteDarkMode"))
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .padding(.trailing)
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Piker")
                        .font(.headline)
                    Picker("Picker", selection: $pickerValue) {
                        ForEach(0 ..< pickerOptions.count) {
                            index in Text(pickerOptions[index]).tag(index)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                .background(Color("WhiteDarkMode"))
                .padding()
                .cardStyle()
                
                VStack(alignment: .leading) {
                    Text("Slider")
                        .font(.headline)
                    
                    HStack {
                        Image(systemName: "sun.min")
                        Slider(value: $sliderValue, in: -5...5, step: 0.1)
                        Image(systemName: "sun.max.fill")
                    }
                }.cardStyle()
                
                VStack(alignment: .leading) {
                    Text("Stepper")
                        .font(.headline)
                    
                    Stepper("Current Value: \(stepperValue)", value: $stepperValue, in: 0...5)
                }.cardStyle()
                
                VStack(alignment: .leading) {
                    Text("Date Picker")
                        .font(.headline)
                    DatePicker(
                        selection: $selectedDate,
                        in: dateRange,
                        displayedComponents: [.hourAndMinute, .date],
                        label: { Text("Deadline") }
                    )
                }.cardStyle()
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text("Context")
                            .font(.headline)
                            .contextMenu {
                                Button("A") { }
                                Button("B") { }
                            }
                    }
                    .frame(height: 120)
                    .padding()
                    .background(Color("WhiteDarkMode"))
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Pro")
                            .font(.headline)
                        Spacer()
                        ProgressView(value: progressValue)
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding(.leading)
                            .padding(.top)
                        Spacer()
                    }
                    .frame(height: 120)
                    .padding()
                    .background(Color("WhiteDarkMode"))
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Map")
                            .font(.headline)
                        
                        Map(coordinateRegion: $location)
                            .frame(width: 100, height: 100, alignment: .center)
                            .cornerRadius(15)
                    }
                    .frame(height: 120)
                    .padding()
                    .background(Color("WhiteDarkMode"))
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .padding(.trailing)
                }
                .padding(.bottom)
            }
        }
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color("WhiteDarkMode"))
            .cornerRadius(15)
            .shadow(radius: 3)
            .padding(.horizontal)
            .padding(.bottom)
    }
}

extension View {
    func cardStyle() -> some View {
        self.modifier(CardModifier())
    }
}
    
#Preview {
    ControlViewBootcamp()
}
