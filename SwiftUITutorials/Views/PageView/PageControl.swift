//
//  PageControl.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/26.
//

/*
  UIViewControllerRepresentable 을 사용하기 위해 UIKit import
    - UIKit View Controller를 SwiftUI에 연결하기 위해 사용하는 프로토콜 : UIViewControllerRepresentable
 */

import SwiftUI
import UIKit


struct PageControl: UIViewRepresentable {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(control: self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        
        control.numberOfPages = numberOfPages
        // event 대상을 Coordinator로 지정
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    
    // Coordinator 유형을 만들고 새로운 코디네이터를 반환하는 메서드를 추가
    class Coordinator: NSObject {
        var control: PageControl
        
        init(control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}

