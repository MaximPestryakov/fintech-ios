import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var editButton: UIButton!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        // На этом моменте ViewController еще ничего не знает о View и поэтому editButton == nil
        if let frame = editButton?.frame {
            print("editButton.frame: \(frame)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("editButton.frame: \(editButton.frame)")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)

        // frame'ы отличаются потому что View только сейчас добавилась и узнала о размерах экрана
        print("editButton.frame: \(editButton.frame)")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }

    @IBAction func changePhoto(_ sender: UIButton) {
        print("Выбери изображение профиля")
    }
}
