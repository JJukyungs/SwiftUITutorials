//
//  FeatureCard.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/26.
//

import SwiftUI

struct FeatureCard: View {
    
    var landmark: Landmark
    
    var body: some View {
        
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            // Image 위에 Text를 Overlay하여 보여줌
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

// Text 정보를 Overlay 하기위해 선언
// Image 안에 글씨를 삽입하기 위해 만듬
struct TextOverlay: View {
    var landmark: Landmark
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center
        )
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}



struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
