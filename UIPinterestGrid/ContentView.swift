//
//  ContentView.swift
//  UIPinterestGrid
//
//  Created by Luiz Araujo on 08/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        var gridItems = [GridItem]()
        for i in 0..<30 {
            let randomHeight = CGFloat.random(in: 100...400)
            gridItems.append(GridItem(height: randomHeight, title: String(i)))
        }

        return VStack {
            ScrollView {
                PinterestGridView(gridItems: gridItems, numOfColumns: 2, spacing: 20, horizontalPadding: 20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
