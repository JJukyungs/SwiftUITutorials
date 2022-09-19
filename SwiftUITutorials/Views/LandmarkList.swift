//
//  LandmarkList.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/19.
//

/*
    [섹션 2 - 4] Landmark List 생성
    - List 를 사용해 목록을 만들 수 있음
    - 정적, 동적으로 만들 수 있다.
 
    [섹션 2 - 5] List 동적으로 만들기
    - 개별 지정 말고 컬렉션에 직접 행을 생성
    - 클로저 활용하여 목록 불러오기
 */

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
