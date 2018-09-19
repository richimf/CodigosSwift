import UIKit




extension UIView {
    func pulse(duration: TimeInterval) {
        UIView.animate(withDuration: duration/2, animations: {
            self.alpha = 0
        }) { _ in
            UIView.animate(withDuration: duration/2, animations: {
                self.alpha = 1
            })
        }
    }
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }
    
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
}

var imageView = UIImageView()
imageView.pulse(duration: 1)
imageView.cornerRadius = 10
imageView.borderWidth = 1
