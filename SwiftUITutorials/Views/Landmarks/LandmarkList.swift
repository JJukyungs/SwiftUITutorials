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
 
    [섹션 3 - 2] List View 필터링
 
    [섹션 3 - 3] 상태를 토글하는 Controller 추가
    - 필터에 대한 사용자 제어
    - 켜기, 끄기를 탭하여 컨트롤이 바인딩을 사용해 view의 상태를 업데이트
 
 */

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    // 속성, 값을 확인하여 List에 필터링된 버전을 보여줌
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                // $ 를 사용하여 상태 변수 또는 해당 속성 중 하나에 대한 바인딩을 엑세스
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) {landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")

        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
