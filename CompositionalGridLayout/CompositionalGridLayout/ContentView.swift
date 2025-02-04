//
//  ContentView.swift
//  CompositionalGridLayout
//
//  Created by Adrian Suryo Abiyoga on 22/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 3
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 6) {
                    PickerView()
                        .padding(.bottom, 10)
                    
                    CompositionalLayout(count: count) {
                        ForEach(0...20, id: \.self) { item in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.blue.opacity(0.9).gradient)
                        }
                    }
                    .animation(.bouncy, value: count)
                }
                .padding(15)
            }
            .navigationTitle("Compositional Grid")
        }
    }
    
    @ViewBuilder
    func PickerView() -> some View {
        Picker("", selection: $count) {
            ForEach(1...4, id: \.self) {
                Text("Count = \($0)")
                    .tag($0)
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    ContentView()
}
