import UIKit

class MessageViewCell: UITableViewCell {

    @IBOutlet weak var message: UILabel!

    func bindWith(message: Message) {
        self.message.text = message.message
        selectionStyle = .none
    }
}
