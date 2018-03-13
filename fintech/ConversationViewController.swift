import UIKit

class ConversationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let incomingMessageIdentifier = "incomingMessage"
    private let outgoingMessageIdentifier = "outgoingMessage"

    let messages = [
        Message(message: "Test Test Test", isIncoming: false),
        Message(message: "Test Test Test Test Test Test", isIncoming: true),
        Message(message: "Test Test Test Test Test Test Test Test Test", isIncoming: false),
        Message(message: "Test Test Test Test Test Test Test Test Test Test Test Test ", isIncoming: true),
        Message(message: "Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test ", isIncoming: false),
        Message(message: "Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test ", isIncoming: true),
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let identifier = message.isIncoming ? incomingMessageIdentifier : outgoingMessageIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MessageViewCell
        cell.bindWith(message: message)
        return cell
    }
}
