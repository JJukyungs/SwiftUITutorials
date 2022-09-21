//
//  HexagonParameters.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/21.
//

/*
    [섹션 4 part] 경로 및 모양 그리기
    - Landmark 방문 시 배지 받을 수 있도록
    
 */

import Foundation


struct HexagonParameters {
    
    // Segment - 육각형의 한 면을 나타내기 위해 정의
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    
    // 육각형의 모양을 조정할 수 있는 조정값
    static let adjustment: CGFloat = 0.085
    
    // 육각형 각 측면에 대해 하나씩 6개의 세그먼트 데이터 추가
    static let segments = [
        Segment(
                  line:    CGPoint(x: 0.60, y: 0.05),
                  curve:   CGPoint(x: 0.40, y: 0.05),
                  control: CGPoint(x: 0.50, y: 0.00)
              ),
        Segment(
                  line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
                  curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
                  control: CGPoint(x: 0.00, y: 0.25 + adjustment)
              ),
        Segment(
                  line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
                  curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
                  control: CGPoint(x: 0.00, y: 0.75 - adjustment)
              ),
        Segment(
                  line:    CGPoint(x: 0.40, y: 0.95),
                  curve:   CGPoint(x: 0.60, y: 0.95),
                  control: CGPoint(x: 0.50, y: 1.00)
              ),
        Segment(
                  line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
                  curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
                  control: CGPoint(x: 1.00, y: 0.75 - adjustment)
              ),
        Segment(
                  line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
                  curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
                  control: CGPoint(x: 1.00, y: 0.25 + adjustment)
              )
    ]
    
}
