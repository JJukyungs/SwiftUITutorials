//
//  Hike.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/22.
//

/*
    [섹션 5] 보기 및 전환 애니메이션
    - HikeData 추가
 
 */

import Foundation


struct Hike: Codable, Hashable, Identifiable {
    
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
    
    // km 변환을 위해 사용
    static var formatter = LengthFormatter()
    
    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Codable, Hashable {
        
        var distanceFromStart: Double
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
    
}
