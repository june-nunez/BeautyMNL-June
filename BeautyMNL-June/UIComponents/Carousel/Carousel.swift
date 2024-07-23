//
//  Carousel.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import UIKit

class Carousel: UIView {
    
    private var timer: Timer?
    
    private let slideDuration: TimeInterval
    
    private var controllers = [UIViewController]()
    
    private let contentView: UIStackView = {
        StackViewBuilder.createStackView(
            .vertical,
            distribution: .equalSpacing,
            spacing: 10
        )
    }()
    
    private let pageController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal
    )
    
    private let pageIndicatorViewModel: PageIndicatorViewModel
    
    private let bannerHeight: CGFloat
    
    private let isPageTappable: Bool
    
    // MARK: - Init
    
    init(
        _ views: [UIView],
        bannerHeight: CGFloat = 300,
        slideDuration: TimeInterval = 0,
        isPageTappable: Bool = false
    ) {
        pageIndicatorViewModel = .init(pageCount: views.count)
        self.controllers = views.map({ view in
            let vc = UIViewController()
            vc.view = view
            return vc
        })
        self.slideDuration = slideDuration
        self.bannerHeight = bannerHeight
        self.isPageTappable = isPageTappable
        
        super.init(frame: .zero)
        
        setup()
        startTimer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension Carousel {
    private func setup() {
        backgroundColor = .white
        setupContentView()
        setupPageController()
        setupPageIndicator()
        
        if isPageTappable {
            setupTapGesture()
        }
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        pageController.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func tapHandler() {
        guard let vc = pageController.viewControllers?.first,
              let index = controllers.firstIndex(of: vc)
        else { return }
        Notif.showTapped("Banner at index: \(index)")
    }
    
    private func setupContentView() {
        addSubview(contentView)
        contentView.fillSuperview(padding: .init(
            top: 0,
            left: 0,
            bottom: 14,
            right: 0
        ))
    }
    
    private func setupPageController() {
        pageController.dataSource = self
        pageController.delegate = self
        
        pageController.setViewControllers(
            [controllers[0]],
            direction: .forward,
            animated: true
        )
        
        contentView.addArrangedSubview(pageController.view)
        
        pageController.view.withHeight(bannerHeight)
    }
    
    private func setupPageIndicator() {
        let pageIndicator = PageIndicator(
            viewModel: pageIndicatorViewModel
        )
        
        let indicatorStack = StackViewBuilder.createStackView(
            .vertical,
            alignment: .center,
            arrangedSubviews: [pageIndicator]
        )
        
        contentView.addArrangedSubview(indicatorStack)
    }
}

// MARK: - Timer

extension Carousel {
    private func startTimer() {
        guard slideDuration > 0 else { return }
        
        timer = Timer.scheduledTimer(withTimeInterval: slideDuration, repeats: true) { [weak self] timer in
            self?.goToNextPage()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
    }
    
    private func resetTimer() {
        stopTimer()
        startTimer()
    }
    
    private func goToNextPage() {
        guard let currentVC = pageController.viewControllers?.first,
              let currentIndex = controllers.firstIndex(of: currentVC)
        else { return }
        
        if currentIndex == controllers.count - 1 {
            /// If currently on last page, move back to the first page
            pageController.setViewControllers([controllers[0]], direction: .forward, animated: true)
            pageIndicatorViewModel.currentPage = 0
        } else {
            /// Go to next page
            let nextIndex = currentIndex + 1
            let nextVC = controllers[nextIndex]
            pageController.setViewControllers([nextVC], direction: .forward, animated: true)
            pageIndicatorViewModel.currentPage = nextIndex
        }
    }
}

// MARK: - Data Source

extension Carousel: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index > 0 {
                return controllers[index - 1]
            } else {
                return nil
            }
        }
        
        return nil
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            } else {
                return nil
            }
        }
        
        return nil
    }
}

// MARK: - Delegate

extension Carousel: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        willTransitionTo pendingViewControllers: [UIViewController]
    ) {
        /// Stop the timer while user is interacting with UI
        stopTimer()
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        /// Reset the timer if user has initiated a gesture (manually scrolled through the carousel).
        resetTimer()
        
        guard let currentVC = pageViewController.viewControllers?.first,
              let currentIndex = controllers.firstIndex(of: currentVC) else { return }
        pageIndicatorViewModel.currentPage = currentIndex
    }
}
