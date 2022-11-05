import Foundation
import UIKit

class BaseButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func setupView() {
        layer.cornerRadius = 10
        clipsToBounds = true
        backgroundColor = .blue
    }
}
