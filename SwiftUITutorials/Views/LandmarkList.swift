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
 
 
    [섹션 2 - 6] Navtigation 연결
    - List 클릭 시 Detail View 로 전환
    - NavigationLink 자세히 파보기
 
    [섹션 2 - 7] 자식 View에 데이터 전달
    - view의 매개변수를 생성하여 데이터 전달할 수 있게 함
 
    [섹션 2 - 8] 동적으로 미리보기 생성
 
 */

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")

        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
