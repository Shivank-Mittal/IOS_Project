
import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let apiService = APIService()
    var array: [Film]?
    //var arr_dum:[Film] = [film_instance]
    var selectedFilm : Film?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.backgroundColor = UIColor.gray.cgColor
        
        apiService.fetchUsers(completionHandler: reloadTable(users:))
    }
    
    func reloadTable(users: [Film]) {
        array = users
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        
        detailViewController.film = selectedFilm
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        
        guard let film = array? [indexPath.row] else
        {
            return UITableViewCell()
        }
        
        
         
        cell.movieName.text = "\(film.Title.uppercased() )"
        cell.setImageFor(urlString: film.Poster )
        cell.boxOfficeCollection.text = film.BoxOffice
           
        return cell
        
        
    }
    
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let array = array else {
            return indexPath}
        selectedFilm = array[indexPath.row]
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
