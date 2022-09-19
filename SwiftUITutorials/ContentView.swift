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
 
 
 
 */
import SwiftUI

struct ContentView: View {
    var body: some View {
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
        }
        // padding 약간의 공간 추가
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
