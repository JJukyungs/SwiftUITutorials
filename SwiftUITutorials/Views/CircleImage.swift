//
//  CircleImage.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/19.
//

/*
    [섹션 4] Custom Image View 생성
    - Image 등록 및 생성
    - clipShape 를 이용하여 이미지 모양 변경
    - 테두리 라인 및 그림자 효과
 
 */
import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)

    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
