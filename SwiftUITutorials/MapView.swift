//
//  MapView.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/19.
//

import SwiftUI
import MapKit


struct MapView: View {
    
    // 지도에 대한 지역정보를 가진 상태변수
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
