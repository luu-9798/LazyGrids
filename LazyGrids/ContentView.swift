//
//  ContentView.swift
//  LazyGrids
//
//  Created by Trung Luu on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    let columnSpec = [
        GridItem(.adaptive(minimum: 100))
    ]
    let rowSpec = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let hotColors: [Color] = [.red, .orange, .pink, .yellow]
    let coldColors: [Color] = [.blue, .teal, .mint, .green]
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columnSpec, spacing: 20) {
                    ForEach(1...99, id: \.self) {index in
                        Text("Item \(index)")
                            .padding(EdgeInsets(top: 30, leading: 15, bottom: 30, trailing: 15))
                            .background(hotColors[index % hotColors.count])
                            .clipShape(Capsule())
                    }
                }
            }
            ScrollView(.horizontal) {
                LazyHGrid(rows: rowSpec, spacing: 20) {
                    ForEach(1...99, id: \.self) { index in
                        Text("Index \(index)")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 30, leading: 15, bottom: 30, trailing: 15))
                            .background(coldColors[index % coldColors.count])
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
