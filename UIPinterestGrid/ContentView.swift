//
//  ContentView.swift
//  UIPinterestGrid
//
//  Created by Luiz Araujo on 08/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var numOfColumns = 3

    let gridItems = GridItem.getMock()
    var body: some View {
        VStack {
            NavigationStack {
                ScrollView {
                    PinterestGridView(gridItems: gridItems, numOfColumns: numOfColumns, spacing: 20, horizontalPadding: 20)
                }
                .navigationTitle("Pinterest Grid")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        removeButton
                    }

                    ToolbarItem(placement: .navigationBarTrailing) {
                        addButton
                    }
                }
            }
        }
    }

    var removeButton: some View {
        Button {
            numOfColumns -= 1

        } label: {
            Text("Remove")
        }
        .disabled(numOfColumns <= 1)
    }

    var addButton: some View {
        Button {
            numOfColumns += 1

        } label: {
            Text("Add")
        }
        .disabled(numOfColumns >= 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
