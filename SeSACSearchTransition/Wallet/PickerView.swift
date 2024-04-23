//
//  PickerView.swift
//  SeSACSearchTransition
//
//  Created by cho on 4/23/24.
//

import SwiftUI

struct PickerView: View {
    let apple = ["iOS", "iPadOS", "macOS", "watchOS", "visionOS"]
    @State var selectedIndex = "macOS"
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(apple, id: \.self) { item in
                        Text(item)
                    }
                }
                Section {
                    Picker(selection: $selectedIndex) {
                        ForEach(apple, id: \.self) { item in
                            Text(item)
                        }
                    } label: {
                        Text("Moana")
                    }
                    .pickerStyle(.menu)

                }
            }
        }
    }
}

#Preview {
    PickerView()
}
