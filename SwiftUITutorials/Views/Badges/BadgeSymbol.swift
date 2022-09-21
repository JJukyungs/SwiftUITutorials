//
//  BadgeSymbol.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/21.
//

import SwiftUI

struct BadgeSymbol: View {
    
    // 사용할 컬러 정의 (SysmbolColor) : 보라색
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)

    
    var body: some View {
        
        GeometryReader { geometry in
                    Path { path in
                        let width = min(geometry.size.width, geometry.size.height)
                        let height = width * 0.75
                        let spacing = width * 0.030
                        let middle = width * 0.5
                        let topWidth = width * 0.226
                        let topHeight = height * 0.488

                        // 맨위 Top 부분
                        path.addLines([
                            CGPoint(x: middle, y: spacing),
                            CGPoint(x: middle - topWidth, y: topHeight - spacing),
                            CGPoint(x: middle, y: topHeight / 2 + spacing),
                            CGPoint(x: middle + topWidth, y: topHeight - spacing),
                            CGPoint(x: middle, y: spacing)
                        ])
                        
                        // 두번 째 middle 부분
                        path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                                      path.addLines([
                                          CGPoint(x: middle - topWidth, y: topHeight + spacing),
                                          CGPoint(x: spacing, y: height - spacing),
                                          CGPoint(x: width - spacing, y: height - spacing),
                                          CGPoint(x: middle + topWidth, y: topHeight + spacing),
                                          CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                                      ])
                    }
                    .fill(Self.symbolColor)
                }
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
