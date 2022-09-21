//
//  RotatedBadgeSymbol.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/21.
//

/*
    심볼을 회전할 수 있게 함
 */

import SwiftUI

struct RotatedBadgeSymbol: View {
    
    let angle: Angle
    
    var body: some View {
        
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
        
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
