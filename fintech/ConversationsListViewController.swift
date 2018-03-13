import UIKit

class ConversationsListViewController: UITableViewController {

    private let openConversationSegue = "openConversation"
    private let conversationIdentifier = "conversation"
    private let profileViewControllerIdentifier = "profileViewController"

    private let headers: [String] = ["Online", "History"]
    private let online: [Conversation]
    private let history: [Conversation]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .done, target: self, action: #selector(openProfile))
    }

    @objc
    func openProfile(sender: UIBarButtonItem) {
        let viewController = storyboard!.instantiateViewController(withIdentifier: profileViewControllerIdentifier)
        present(viewController, animated: true)
    }

    required init?(coder aDecoder: NSCoder) {
        let conversations = [
            Conversation(name: "Max", message: "Hi!", date: Date(timeIntervalSince1970: 1520695328), online: true, hasUnreadMessages: true),
            Conversation(name: "Sam", message: "Hello, World!", date: Date(timeIntervalSince1970: 1520569200), online: true, hasUnreadMessages: false),
            Conversation(name: "Jack", message: "Good bye!", date: Date(timeIntervalSince1970: 1520515980), online: true, hasUnreadMessages: false),
            Conversation(name: "John", message: nil, date: nil, online: false, hasUnreadMessages: false),
            Conversation(name: "Max", message: "Hi!", date: Date(timeIntervalSince1970: 1520695328), online: false, hasUnreadMessages: false),
            Conversation(name: "Sam", message: "Hello, World!", date: Date(timeIntervalSince1970: 1520569200), online: true, hasUnreadMessages: false),
            Conversation(name: "Jack", message: "Good bye!", date: Date(timeIntervalSince1970: 1520515980), online: false, hasUnreadMessages: false),
            Conversation(name: "John", message: nil, date: nil, online: true, hasUnreadMessages: false),
            Conversation(name: "Sam", message: "Hello, World!", date: Date(timeIntervalSince1970: 1520569200), online: true, hasUnreadMessages: true),
            Conversation(name: "Jack", message: "Good bye!", date: Date(timeIntervalSince1970: 1520515980), online: true, hasUnreadMessages: false),
            Conversation(name: "John", message: nil, date: nil, online: false, hasUnreadMessages: false),
            Conversation(name: "Max", message: "Hi!", date: Date(timeIntervalSince1970: 1520695328), online: false, hasUnreadMessages: false),
            Conversation(name: "Sam", message: "Hello, World!", date: Date(timeIntervalSince1970: 1520569200), online: true, hasUnreadMessages: false),
            Conversation(name: "Jack", message: "Good bye!", date: Date(timeIntervalSince1970: 1520515980), online: false, hasUnreadMessages: false),
            Conversation(name: "John", message: nil, date: nil, online: true, hasUnreadMessages: false),
            Conversation(name: "Sam", message: "Hello, World!", date: Date(timeIntervalSince1970: 1520569200), online: true, hasUnreadMessages: false),
            Conversation(name: "Jack", message: "Good bye!", date: Date(timeIntervalSince1970: 1520515980), online: true, hasUnreadMessages: false),
            Conversation(name: "John", message: nil, date: nil, online: false, hasUnreadMessages: false),
            Conversation(name: "Max", message: "Hi!", date: Date(timeIntervalSince1970: 1520695328), online: false, hasUnreadMessages: false),
            Conversation(name: "Sam", message: "Hello, World!", date: Date(timeIntervalSince1970: 1520569200), online: true, hasUnreadMessages: false),
            Conversation(name: "Jack", message: "Good bye!", date: Date(timeIntervalSince1970: 1520515980), online: false, hasUnreadMessages: true),
            Conversation(name: "John", message: nil, date: nil, online: true, hasUnreadMessages: false)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: conversationIdentifier, for: indexPath) as! ConversationTableViewCell
        if indexPath.section == 0 {
            cell.bindWith(conversation: online[indexPath.row])
        } else {
            cell.bindWith(conversation: history[indexPath.row])
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: openConversationSegue, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == openConversationSegue {
            let conversationViewController = segue.destination as! ConversationViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                let conversation: Conversation
                if indexPath.section == 0 {
                    conversation = online[indexPath.row]
                } else {
                    conversation = history[indexPath.row]
                }
                conversationViewController.title = conversation.name
            }
        }
    }
}
