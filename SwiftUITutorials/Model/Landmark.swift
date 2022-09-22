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
    
    [섹션 3 - 1] 즐겨 찾기 추가
    - isFavorite 추가하여 별 표시를 할 수 있게 추가
 
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
    var isFavorite: Bool
    var isFeatured: Bool
    
    // Category 데이터
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    
    
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
