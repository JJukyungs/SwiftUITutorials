//
//  BadgeBackground.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/21.
//

/*
    [섹터 4 part] 배지 배경 그리기
    - 이미지를 가지고 오는게 아닌 SwiftUI를 활용하여 이미지 그리기
    - 생각보다 엄청 어렵..
 */

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        
        GeometryReader { geometry in
            
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                
                // move(to:) : Begins a new subpath at the specified point.
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                    
                }
            }
            .fill(.linearGradient(
                Gradient(
                    colors: [Self.gradientStart, Self.gradientEnd]
                ),
                startPoint: UnitPoint(
                    x: 0.5,
                    y: 0
                ),
                endPoint: UnitPoint(
                    x: 0.5,
                    y: 0.6
                )
            ))
        }
        .aspectRatio(1, contentMode: .fit)
    }
    
    // 색깔 지정
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)

}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
