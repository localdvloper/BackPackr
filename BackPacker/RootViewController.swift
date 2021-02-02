//
//  RootViewController.swift
//  BackPacker
//
//  Created by 심현지 on 2021/01/29.
//

import UIKit

class RootViewController: UIViewController {
    
    var viewModel : RootViewModel!
        
    let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    let scrollView : UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .groupTableViewBackground
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        viewModel = RootViewModel(delegate: self)
        
        self.view.backgroundColor = .white

        /// scrollview
        scrollView.anchor(in: self.view)
        
        stackView.anchor(in: scrollView)
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    // MARK: Setup Views
    
    /// 데이터 통신이 끝난 후 arranged subviews를 셋업한다.
    fileprivate func setupView(data: ITunesData) {
        
        /// navigation title
        self.title = data.trackName
        
        /// 이미지
        let sshotVC = ScreenshotsViewController(data: data)
        addChild(sshotVC)
        
        /// 크기
        let sizeVM = InfoViewModel(title: "크기", description: data.fileSizeBytes.toMegaByteString())
        let sizeView = InfoView(viewModel: sizeVM)
        
        /// 새로운 기능
        let newVersionVM = InfoViewModel(title: "새로운 기능", description: data.version, detail: data.releaseNotes)
        let newVersionView = InfoView(viewModel: newVersionVM, hasSeparator: false, delegate: self)

        /// 릴리즈 노트
        let releaseTextView = makeTextView(data.releaseNotes)
        releaseTextView.textColor = .theme
        releaseTextView.isHidden = true
                
        /// description
        let desTextView = makeTextView(data.description)
        desTextView.textAlignment = .center
        desTextView.font = UIFont.systemFont(ofSize: 15)
        
        /// 장르
        let tagVC = TagViewController()
        addChild(tagVC)
        tagVC.tags = data.genres
        
        /// StackView에 추가
        addStack(sshotVC.view, height: view.bounds.height / 2, withPadding: true)
        addStack(sizeView, height: 65)
        addStack(newVersionView, height: 65, withPadding: true)
        addStack(releaseTextView, height: nil, withPadding: true)
        addStack(desTextView, height: nil, withPadding: true)
        addStack(tagVC.view, height: tagVC.viewHeight)
    }
    
    /// TextView 기본값
    fileprivate func makeTextView(_ text: String) -> UITextView {
        
        let view = UITextView()
        view.isScrollEnabled = false
        view.isEditable = false
        view.text = text
        view.textContainerInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return view
    }
    
    func addStack(_ view: UIView, height: CGFloat?, withPadding: Bool = false) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(view)

        if let height = height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        view.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        
        if withPadding {
            stackView.setCustomSpacing(10, after: view)
        }
    }
}

// MARK: RootViewModelDelegate

extension RootViewController : RootViewModelDelegate {
    
    func fetchDidComplete(result: Bool, data: ITunesData?) {
        
        if result == true, let data = data {
            setupView(data: data)
        }
    }
}

// MARK: InfoViewDelegate

extension RootViewController : InfoViewDelegate {
    
    func didTapInfoView(_ infoView: InfoView, isCollapse: Bool) {
        
        if let index = stackView.arrangedSubviews.firstIndex(of: infoView) {
            
            let nextTextView = stackView.arrangedSubviews[index + 1]
            
            stackView.setCustomSpacing(isCollapse ? 0 : 10, after: infoView)
            stackView.setCustomSpacing(isCollapse ? 10 : 0, after: nextTextView)
           
            nextTextView.isHidden  = !isCollapse
            
            infoView.setCollapsed(collapsed: !isCollapse)
        }
    }
}
