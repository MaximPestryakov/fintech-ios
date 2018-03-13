import UIKit

class ConversationTableViewCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var date: UILabel!

    func bindWith(conversation: Conversation) {
        name.text = conversation.name
        message.text = conversation.message
        if let date = conversation.date {
            self.date.text = DateUtils.string(from: date)
            self.date.isHidden = false
        } else {
            self.date.isHidden = true
        }
        if conversation.hasUnreadMessages {
            message.font = UIFont(descriptor: message.font.fontDescriptor.withSymbolicTraits(.traitBold)!, size: message.font.pointSize)
        } else {
            message.font = UIFont(name: message.font.familyName, size: message.font.pointSize)
        }
    }
}
