import WebKit

class LoginViewController: UIViewController {
    @IBOutlet var webView: WKWebView!

    let urlString = "http://13.125.127.249/sidedish08/api/oauth/login"

    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL = URL(string: urlString)
        let myRequest = URLRequest(url: myURL!)
        webView.navigationDelegate = self
        webView.load(myRequest)
    }

    @IBAction func touchDoneButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension LoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        debugPrint(navigationResponse.response)
        if let response = navigationResponse.response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
            print("로그인 성공")
            self.dismiss(animated: true, completion: nil)
        }
        decisionHandler(.allow)
    }
}
