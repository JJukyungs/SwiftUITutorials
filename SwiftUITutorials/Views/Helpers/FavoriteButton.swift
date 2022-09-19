//
//  FavoriteButton.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/19.
//


/*
    [섹션 3 - 6] landmark 즐겨찾기 버튼
 
 */
import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle", systemImage: isSet ? "start.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
