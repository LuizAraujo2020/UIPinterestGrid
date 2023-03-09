//
//  GridItem.swift
//  UIPinterestGrid
//
//  Created by Luiz Araujo on 08/03/23.
//

import Foundation

struct GridItem: Identifiable {
    let id = UUID()
    let height: CGFloat
    let imgString: String

    static func getMock() -> [GridItem] {
        var result = [GridItem]()

        for i in 0...52 {
            let item = GridItem(height: CGFloat.random(in: 100...400),
                                imgString: String("img_\(i)"))
            result.append(item)
        }

        return result
    }
}
