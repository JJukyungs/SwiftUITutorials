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
                
                // 취소 버튼 추가 (편집 내용은 저장 X)
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                // 프로필 수정 시 업데이트
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
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
