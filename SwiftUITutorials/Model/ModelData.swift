//
//  ModelData.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/19.
//

import Foundation

// 초기화 할 수 있도록 배열 선언
var landmarks: [Landmark] = load("landmarkData.json")

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
