//
//  Today_Task.swift
//  life_Todo
//
//  Created by admin on 2021/05/16.
//

import UIKit

class Today_Task: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //今日のタスクリストの宣言
    var Today_taskList=[String]()
    //userDefaultsの変数化
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let storedToday_taskList = userDefaults.array(forKey: "Today_taskList") as? [String] {
            Today_taskList.append(contentsOf: storedToday_taskList)
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Today_taskList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Today_todo_Cell", for: indexPath)
        let todoTitle = Today_taskList[indexPath.row]
        cell.textLabel?.text = todoTitle
        return cell
    }
    
    @IBAction func addActionToday(_ sender: Any) {
        let alertController = UIAlertController(title: "ToDo追加", message: "ToDoを入力してください。", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField(configurationHandler: nil)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (acrion: UIAlertAction) in
            // 追加：OKをタップした時の処理
            if let textField = alertController.textFields?.first {
                self.Today_taskList.insert(textField.text!, at: 0)
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                self.userDefaults.set(self.Today_taskList, forKey: "Today_taskList")
            }
        }
        alertController.addAction(okAction)
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete {
                print(Today_taskList)
                Today_taskList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
                // 削除した内容を保存
                userDefaults.set(Today_taskList, forKey: "todoList")
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
