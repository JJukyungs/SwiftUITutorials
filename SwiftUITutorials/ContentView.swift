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
    var body: some View {
        VStack{
            MapView()
                .ignoresSafeArea(edges: .top) // safeArea까지 넣을 수 있게 해줌
                .frame(height: 300) // 매개변수만 지정하면 너비에 맞게 자동 조정
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    // Spacer() : 장치의 전체 너비를 사용하도록 하게 함
                    // 상위 뷰의 모든 공간을 사용
                    Text("California")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider() // 구분선 넣기
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            // padding 약간의 공간 추가
            .padding()
            
            // 외부 하단에 스페이서를 추가해 화면 상단으로 밀어넣기
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
