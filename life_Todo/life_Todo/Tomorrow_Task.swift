//
//  Tomorrow_Task.swift
//  life_Todo
//
//  Created by admin on 2021/05/16.
//

import UIKit

class Tomorrow_Task: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    //明日のタスクリストの宣言
    var Tomorrow_taskList=[String]()
    //userDefaultsの変数化
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let storedTomorrow_taskList = userDefaults.array(forKey: "Tomorrow_taskList") as? [String] {
            Tomorrow_taskList.append(contentsOf: storedTomorrow_taskList)
        }
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tomorrow_taskList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Tomorrow_todo_Cell", for: indexPath)
        let todoTitle = Tomorrow_taskList[indexPath.row]
        cell.textLabel?.text = todoTitle
        return cell
    }
    
    @IBAction func addActionTomorrow(_ sender: Any) {
        let alertController = UIAlertController(title: "ToDo追加", message: "ToDoを入力してください。", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField(configurationHandler: nil)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (acrion: UIAlertAction) in
            // 追加：OKをタップした時の処理
            if let textField = alertController.textFields?.first {
                self.Tomorrow_taskList.insert(textField.text!, at: 0)
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                self.userDefaults.set(self.Tomorrow_taskList, forKey: "Tomorrow_taskList")
            }
        }
        alertController.addAction(okAction)
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            print(Tomorrow_taskList)
            Tomorrow_taskList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            // 削除した内容を保存
            userDefaults.set(Tomorrow_taskList, forKey: "Tomorrow_taskList")
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
