//
//  PinterestGridView.swift
//  UIPinterestGrid
//
//  Created by Luiz Araujo on 08/03/23.
//

import SwiftUI

struct PinterestGridView: View {

    struct Column: Identifiable {
        let id = UUID()
        var gridItems = [GridItem]()
    }

    //    let columns = [
    //        Column(gridItems: [
    //            GridItem(height: 200, title: "1"),
    //            GridItem(height:  50, title: "4"),
    //            GridItem(height: 100, title: "5"),
    //            GridItem(height: 500, title: "7")
    //        ]),
    //        Column(gridItems: [
    //            GridItem(height:  50, title: "2"),
    //            GridItem(height: 300, title: "3"),
    //            GridItem(height: 100, title: "6"),
    //            GridItem(height: 300, title: "8")
    //        ])
    //    ]
    let columns: [Column]

    var spacing: CGFloat
    var horizontalPadding: CGFloat


    /// Calculate the Grid Layout so that it is more dynamic
    init(gridItems: [GridItem], numOfColumns: Int, spacing: CGFloat = 20, horizontalPadding: CGFloat = 20) {
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding

        var columns = [Column]()
        for _ in 0..<numOfColumns {
            columns.append(Column())
        }

        /// Stores the current height of each column, so that we can find out wich one is the smallest...
        var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)

        for gridItem in gridItems {
            var smallestColumnIndex = 0
            var smallestHeight = columnsHeight.first!

            for i in 1..<columnsHeight.count {
                let curHeight = columnsHeight[i]

                if curHeight < smallestHeight {
                    smallestHeight =  curHeight
                    smallestColumnIndex = i
                }
            }

            columns[smallestColumnIndex].gridItems.append(gridItem)
            columnsHeight[smallestColumnIndex] += gridItem.height
        }

        self.columns = columns
    }

    
    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(columns) { column in

                LazyVStack(spacing: spacing) {
                    ForEach(column.gridItems) { gridItem in

                        getItemView(gridItem: gridItem)
                            .onAppear {
                                print(gridItem)
                            }
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }

    func getItemView(gridItem: GridItem) -> some View {
        ZStack(alignment: .topLeading) {
            GeometryReader { reader in
                Image(gridItem.imgString)
                    .resizable()
                    .scaledToFill()
                    .frame(width: reader.size.width,
                           height: reader.size.height,
                           alignment: .center)
            }


            Text(gridItem.imgString)
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background(
                    Capsule(style: .continuous)
                        .foregroundColor(Color.gray.opacity(0.75))
                )
                .scaleEffect(0.5)
        }
        .frame(height: gridItem.height)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 13))
    }
}

struct PinterestGridView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
