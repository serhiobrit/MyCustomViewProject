//
//  MyCustomView.swift
//  MyCustomViewProject
//
//  Created by Serhio Brit on 22.03.2021.
//

import UIKit

class MyCustomView: UIView {
    
    @IBOutlet weak var labelForView: UILabel!
    
    var labelText: String {
        get {
            return labelForView.text!
        }
        set(labelText) {
            labelForView.text = labelText
        }
    }
    
    var workingView: UIView!
    var xibName: String = "MyCustomView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
    }
    
    func getFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setCustomView() {
        workingView = getFromXib()
        workingView.frame = bounds
        workingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(workingView)
    }
    
}
