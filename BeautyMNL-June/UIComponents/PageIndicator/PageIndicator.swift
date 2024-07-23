//
//  PageIndicator.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import LBTATools

class PageIndicator: UIView {
    
    let viewModel: PageIndicating
    
    private var diamonds: [UIView] = []
    
    init(viewModel: PageIndicatorViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.diamonds = createDiamonds()
        
        setupStackView()
        
        indicateCurrentPage(viewModel.currentPage)
        
        viewModel.onChangePage = { [weak self] page in
            self?.indicateCurrentPage(page)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup

extension PageIndicator {
    private func setupStackView() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        diamonds.forEach { diamond in
            stackView.addArrangedSubview(diamond)
        }
        
        addSubview(stackView)
        stackView.fillSuperview()
    }
}

// MARK: - Private

extension PageIndicator {
    private func indicateCurrentPage(_ page: Int) {
        diamonds
            .enumerated()
            .forEach { index, diamond in
                let isSelected = (index == page)
                
                let scale: CGFloat = isSelected ? 1.6 : 1
                
                let opacity: CGFloat = isSelected ? 1 : 0.5
                
                UIView.animate(withDuration: 0.3) {
                    diamond.transform = .init(scaleX: scale, y: scale)
                    diamond.alpha = opacity
                }
            }
    }
    
    private func createDiamonds() -> [UIView] {
        var diamonds: [UIView] = []
        for _ in 0 ..< viewModel.pageCount {
            diamonds.append(diamond)
        }
        return diamonds
    }
    
    private var diamond: UIView {
        let diamondView = UIImageView(image: AppImage.diamond)
        diamondView.withSize(.init(width: 7, height: 7))
        diamondView.contentMode = .scaleAspectFit
        
        return diamondView
    }
}
