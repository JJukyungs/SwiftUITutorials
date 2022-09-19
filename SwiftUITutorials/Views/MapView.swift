//
//  MapView.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/19.
//

/*
    [섹션 5] 다른 프레임워크 사용 (MapKit)
    
 */

import SwiftUI
import MapKit


struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    // 지도에 대한 지역정보를 가진 상태변수
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    // 좌표 값 기반으로 업데이트 하는 메서드
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
