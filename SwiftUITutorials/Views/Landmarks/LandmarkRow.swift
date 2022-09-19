//
//  LandmarkRow.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/19.
//

/*
    [센션 2 - 2] Row View 만들기
    - landmark 세부 정보를 보여주는 행
    - 나중에 여러 행을 랜드마크 목록으로 만듬
    [섹션 2 - 3] Row PreView
    - PreviewProvider
    - 미리보기를 정확하게 랜더링
    - Group 을 사용하여 묶어서 사용 가능
 
    [섹션 3 - 1] 즐겨 찾기 별 표시
    
 */

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
