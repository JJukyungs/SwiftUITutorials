//
//  Landmark.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/19.
//


/*
    [섹션 2 - 1] Landmark 모델 생성
    - 자료에서 받은 Json 파일을 추가
    - 사용할 Json 변수들을 모델로 구현
    - Json 데이터를 파싱 할 수 있게 메서드 구현
    - Identifiable 추가하여 landmark 요소를 직접 사용할수 있게 함
 
 */

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // 데이터에서 이미지 이름을 읽어오고 로드하는 메서드 생성
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
        
    }
}
