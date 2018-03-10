import UIKit

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableImage: UIImageView {
}

extension UIView {

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
}

extension UIButton {

    @IBInspectable
    var scaleAspectFit: Bool {
        get {
            return imageView?.contentMode == .scaleAspectFit
        }
        set {
            imageView?.contentMode = newValue ? .scaleAspectFit : .scaleAspectFill
        }
    }
}
