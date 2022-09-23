//
//  ModelData.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/19.
//


/*
    [섹션 3 - 4] 저장을 위해 관찰 가능한 객체 사용
    - landmark 데이터를 관찰 가능한 객체에 저장
    
 */
import Foundation
import Combine

//
final class ModelData: ObservableObject {
    // 초기화 할 수 있도록 배열 선언
    // 관찰 가능한 개체는 구독자가 변경 사항을 선택 할 수 도있도록 데이터에 변경 사항을 게시해야함
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    // profile 인스턴스를 포함하도록 업데이트
    @Published var profile = Profile.default
    
    // Hike 데이터 로드 [수정을 하지 않기 때문에 @Published 사용 X]
    var hikes: [Hike] = load("hikeData.json")

    
    
    
    // Category 데이터를 Dic에 추가하고 키에 Landmark 배열 연결
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    var features: [Landmark] {
        landmarks.filter {
            $0.isFeatured
        }
    }
    
}


// Json 데이터를 파싱 할 수 있게 해주는 메서드 생성
func load<T: Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) in main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
