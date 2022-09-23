//
//  ProfileHost.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/23.
//

import SwiftUI

struct ProfileHost: View {
    // editMode
    /// @EnvironmentSwiftUI는 속성 래퍼 를 사용하여 액세스할 수 있는 값에 대한 환경의 저장소를 제공합니다 . 편집 범위를 읽거나 쓰기 위해 값에 액세스합니다 .
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    
    @State private var draftProfile = Profile.default
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
