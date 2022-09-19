//
//  LandmarkDetail.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/19.
//

import SwiftUI

struct LandmarkDetail: View {
    
    var landmark: Landmark
    
    var body: some View {
        
    
        ScrollView{
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top) // safeArea까지 넣을 수 있게 해줌
                .frame(height: 300) // 매개변수만 지정하면 너비에 맞게 자동 조정
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    // Spacer() : 장치의 전체 너비를 사용하도록 하게 함
                    // 상위 뷰의 모든 공간을 사용
                    Text(landmark.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider() // 구분선 넣기
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            // padding 약간의 공간 추가
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
