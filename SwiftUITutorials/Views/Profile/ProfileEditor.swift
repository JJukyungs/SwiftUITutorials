//
//  ProfileEditor.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/23.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile

    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        
        return min...max
    }
    
    var body: some View {
    
        List {
            HStack {
                Text("Username")
                    .bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
                    .bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo")
                    .bold()
                
                // 미리보기 항목처럼 만들 수있음
                // pickerStyle 로 여러 방식 선택
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                        
                    }
                }
                .pickerStyle(.segmented)
            }
            
            // DatePicekr를 추가하여 랜드마크 방문 날짜를 수정할 수 있게 함
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
                    .bold()
            }
        }
        
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
