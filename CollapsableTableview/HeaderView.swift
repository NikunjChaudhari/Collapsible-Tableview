//
//  HeaderView.swift
//  CollapsableTableview
//
//  Created by macos on 28/07/20.
//  Copyright © 2020 macos. All rights reserved.
//

import UIKit

protocol  headerDelegate {
    func callHeader(idx:Int)
}
class HeaderView: UIView {

    var SecIndex : Int?
    var delegate : headerDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(btn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var btn:UIButton =
    {
        let btn = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height))
        btn.backgroundColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
        btn.addTarget(self, action: #selector(self.handle), for: .touchUpInside)
        return btn
    }()
    
    @objc func handle(sender: UIButton)
    {
        if let idx = SecIndex
        {
            delegate?.callHeader(idx: idx)
        }
    }
}
