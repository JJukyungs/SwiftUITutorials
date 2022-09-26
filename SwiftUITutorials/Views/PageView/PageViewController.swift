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

    // Binding 추가
    @Binding var currentPage: Int
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    
    // error fix 로 추가
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        
        uiViewController.setViewControllers(
//            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true
        )
    }
    
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    // Coordinator 내부에 중첩 클래스 선언
    // UIPageViewControllerDataSource 선언 [필수 메서드 작성]
    // UIPageViewControllerDelegate 선언 추가
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
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
        
        // Deleagate 메소드 추가
        /// SwiftUI 는 페이지 전환 애니메이션이 완료될 때 마다 이 메서드를 호출하여 viewController의 Index를 찾아 Binding을 업데이트 할 수 있음
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
