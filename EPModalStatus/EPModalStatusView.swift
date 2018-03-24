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
    var timer: Timer?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    public override func didMoveToSuperview() {
        // Fade in when added to superview
        // Then add a timer to remove the view
        contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.15,
                       animations: {
            self.contentView.alpha = 1.0
            self.contentView.transform = CGAffineTransform.identity
        }) { _ in
            self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(3.0),
                                              target: self,
                                              selector: #selector(self.removeSelf),
                                              userInfo: nil,
                                              repeats: false)
        }
//        UIView.animate(withDuration: 0.15, animations: {
//            self.contentView.alpha = 1.0
//            self.contentView.transform = CGAffineTransform.identity
//        }) { _ in
//            self.timer = Timer.scheduledTimer(
//                timeInterval: TimeInterval(3.0),
//                target: self,
//                selector: #selector(self.removeSelf),
//                userInfo: nil,
//                repeats: false)
//        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    public override func layoutSubviews() {
        // round corner
        self.layoutIfNeeded()
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
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
        contentView.alpha = 0.0
        headlineLabel.text = ""
        subheadLabel.text = ""
        
    }
    
    @objc private func removeSelf() {
        // Animate removal of view
        UIView.animate(withDuration: 0.15,
                       animations: {
                        self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                        self.contentView.alpha = 0.0
        }) { _ in
            self.removeFromSuperview()
        }
    }
}
