//
//  InfoView.swift
//  BackPacker
//
//  Created by 심현지 on 2021/02/01.
//

import UIKit

protocol InfoViewDelegate {
    func didTapInfoView(_ infoView: InfoView, isCollapse: Bool)
}

/// 1줄짜리 인포메이션을 나타내는 뷰
class InfoView : UIView {
    
    var delegate: InfoViewDelegate?

    fileprivate let stackView : UIStackView = {
        
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillProportionally
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// 제목
    let titleLabel : UILabel = {
        let view = UILabel()
        view.textColor = .theme
        return view
    }()
    
    /// 내용
    let descriptionLabel : UILabel = {
        let view = UILabel()
        view.textAlignment = .right
        view.textColor = .theme
        return view
    }()
    
    /// 화살표 아이콘
    let arrow : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "arrow.png")
        view.contentMode = .center
        view.isHidden = true
        return view
    }()
    
    /// 하단 구분선
    let separator : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    var viewModel : InfoViewModel! {
        didSet {
            setupViewModel(viewModel)
        }
    }
    
    // MARK: init
    /// InfoView initializer
    /// - parameter viewModel : InfoViewModel
    /// - parameter hasSeparator : Bool (true : 하단 구분선을 추가)
    /// - parameter delegate : InfoViewDelegate 탭 제스쳐 전달 delegate
    init(viewModel: InfoViewModel, hasSeparator: Bool = true, delegate : InfoViewDelegate? = nil) {
        super.init(frame: .zero)
        setupUI()
        self.viewModel = viewModel
        setupViewModel(viewModel)
        separator.isHidden = !hasSeparator
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    /// viewModel이 변경될 때 호출하는 함수
    fileprivate func setupViewModel(_ viewModel: InfoViewModel) {
        
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        
        if viewModel.detail != nil {
            addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(InfoView.tapHeader(gestureRecognizer:))))
            arrow.isHidden = false
        }
        
        setCollapsed(collapsed: viewModel.isCollapsed)
    }
    
    /// UI Autolayout Setup
    fileprivate func setupUI() {
        
        backgroundColor = .white
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(arrow)
        
        titleLabel.widthAnchor.constraint(equalTo: descriptionLabel.widthAnchor, multiplier: 1.0).isActive = true
        arrow.widthAnchor.constraint(equalToConstant: 30).isActive = true

        /// 아래쪽에 구분선 추가
        addSubview(separator)
        separator.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 1, right: 10), size: CGSize(width: 0, height: 1))
    }
    
    /// 탭 제스쳐 핸들러
    @objc func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        
        guard let view = gestureRecognizer.view as? InfoView else {
            return
        }

        delegate?.didTapInfoView(view, isCollapse: viewModel.isCollapsed)
    }
    
    open func setCollapsed(collapsed: Bool) {
        
        separator.isHidden = collapsed ? true : false
        arrow.transform = CGAffineTransform(rotationAngle: collapsed ? 0.0 : CGFloat.pi)
        
        viewModel.isCollapsed = collapsed
    }
}
