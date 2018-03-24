//
//  EPModalStatusView.swift
//  EPModalStatus
//
//  Created by Erik Perez on 3/23/18.
//  Copyright © 2018 Erik Perez. All rights reserved.
//

import UIKit

public class EPModalStatusView: UIView {
    @IBOutlet private weak var statusImageView: UIImageView!
    @IBOutlet private weak var headlineLabel: UILabel!
    @IBOutlet private weak var subheadLabel: UILabel!
    
    let nibName = "EPModalStatusView"
    var contentView: UIView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    public func set(image:  UIImage) {
        statusImageView.image = image
    }
    
    public func set(headline text: String) {
        headlineLabel.text = text
    }
    
    public func set(subheading text: String) {
        subheadLabel.text = text
    }
    
    private func setUpView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName,
                        bundle: bundle)
        
        contentView = nib.instantiate(withOwner: self,
                                      options: nil).first as! UIView
        addSubview(contentView)
        
        contentView.center = self.center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        headlineLabel.text = ""
        subheadLabel.text = ""
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
