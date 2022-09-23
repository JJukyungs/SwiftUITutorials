//
//  HikeBadge.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/23.
//

import SwiftUI

struct HikeBadge: View {
    
    var name: String
    
    var body: some View {
        
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            // frame 을 두번 쓴 이유
            /// 최종 결과물에서 원하는 크기를 얻으려면 렌더링된 결과의 크기를 조정하고 비교적 작은 프레임에 배치해야함
            /// 좀 더 알아보자
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
