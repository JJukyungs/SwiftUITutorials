//
//  PageViewController.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/26.
//

import SwiftUI
import UIKit


// 여기 부분이 잘 이해가 안된다.
/// Page 부분을 만들려 하는거 다시 찾아보자
///
// Coordinater -> Controller를 저장하기 좋은 장소
/// 시스템이 Contorller를 한번만 초기화 하고 View Contorller를 업데이트 하기 전에 Controller를 초기화함

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    
    var pages: [Page]

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    
    // error fix 로 추가
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        
        uiViewController.setViewControllers(
//            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
            [context.coordinator.controllers[0]], direction: .forward, animated: true
        )
    }
    
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        
        return pageViewController
    }
    
    // Coordinator 내부에 중첩 클래스 선언
    // UIPageViewControllerDataSource 선언 [필수 메서드 작성]
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(parent: PageViewController) {
            self.parent = parent
            controllers = self.parent.pages.map {
                UIHostingController(rootView: $0)
            }
        }
        
        // UIPageViewControllerDataSource 필수 메서드
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == 0 {
                return controllers.last
            }
            
            return controllers[index - 1]
        }
            
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index + 1 == controllers.count {
                return controllers.first
            }
            
            return controllers[index + 1]
        }
    }
}
