//
//  Badge.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/21.
//


/*
    GeometryReader
    - 앱의 다른 곳이나 다른 크기의 디스플레이셔 뷰를 재사용 할 때 올바르지 않을 수 있는 하드 코딩, 숫자 대신 뷰를 동적으로 그리거나 배치하고 크기를 조정하는데 사용
 */

import SwiftUI

struct Badge: View {
    
    var badgeSymbols: some View {
        
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)   // 이미지 투명도
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0 , y: (3.0 / 4.0) * geometry.size.height)
            }
            
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
