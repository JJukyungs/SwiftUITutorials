//
//  Profile.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/23.
//

/*
    [사용자 프로필 데이터 모델 구현]
 */

import Foundation


struct Profile {
    
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    
    static let `default` = Profile(username: "g_kumar")

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}

