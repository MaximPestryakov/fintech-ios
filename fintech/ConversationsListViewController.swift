import UIKit

class ConversationsListViewController: UITableViewController {

    private let headers: [String] = ["Online", "History"]
    private let online: [Conversation]
    private let history: [Conversation]

    required init?(coder aDecoder: NSCoder) {
        let conversations = [
            Conversation(name: "Max", message: "Hi!", date: Date(timeIntervalSince1970: 1520695328), online: true, hasUnreadMessages: false),
            Conversation(name: "Sam", message: "Hello, World!", date: Date(timeIntervalSince1970: 1520569200), online: true, hasUnreadMessages: false),
            Conversation(name: "Jack", message: "Good bye!", date: Date(timeIntervalSince1970: 1520515980), online: true, hasUnreadMessages: false),
            Conversation(name: "John", message: nil, date: nil, online: false, hasUnreadMessages: false)
        ]

        online = conversations.filter {
            $0.online
        }.sorted {
            ($0.date?.timeIntervalSince1970 ?? 0) > ($1.date?.timeIntervalSince1970 ?? 0)
        }
        history = conversations.filter {
            !$0.online
        }.sorted {
            ($0.date?.timeIntervalSince1970 ?? 0) > ($1.date?.timeIntervalSince1970 ?? 0)
        }
        super.init(coder: aDecoder)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return online.count
        }
        return history.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ConversationTableViewCell
        let conversation: Conversation
        if indexPath.section == 0 {
            conversation = online[indexPath.row]
        } else {
            conversation = history[indexPath.row]
        }
        cell.name.text = conversation.name
        cell.message.text = conversation.message
        if let date = conversation.date {
            cell.date.text = DateUtils.string(from: date)
        } else {
            cell.date.isHidden = true
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "myseg", sender: self)
    }
}
