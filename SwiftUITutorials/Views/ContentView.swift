//
//  ContentView.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/16.
//
/*
    [섹션 2] 텍스트 사용자 정의
    - 코드를 변경하거나 인스펙터를 사용하여 사용자의 입맛에 맞게 변경할 수 있다.
 
    [섹션 3] 스택을 사용하여 view 결합
    - VStack, HStack 을 사용하여 결합시킬 수 있다.
    - Spacer를 이용하여 장치의 전체너비 사용하도록 하거나 상위 뷰의 모든 공간을 사용할 수 있게함
    - padding 을 이용해 약간의 공간을 추가
 
    [섹션 6] Detail View
    - UI 작성이 확실히 엄청 편리해진거 같기도 하다.
    - View를 손쉽게 불러와서 작업을 할 수 있다.
    - offset, padding 으로 view를 겹치게 하고 땡기게 할 수 있음
    - Divider() 를 사용해 구분선을 생성할 수 있다.
    - StackView를 좀 더 쉽게 사용할 수 있는 느낌?
    
 
 
 */
import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    // App 의 기본 보기 방식을 선택할 수 있도록함
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
