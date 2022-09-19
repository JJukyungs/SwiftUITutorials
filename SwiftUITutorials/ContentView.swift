//
//  ContentView.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/16.
//

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
