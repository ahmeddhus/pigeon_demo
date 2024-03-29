import UIKit
import Flutter

class MyApi: NSObject, MoviesHostApi {
    func getMovies(urlString: String, completion: @escaping (Result<String?, Error>) -> Void) {
        return MoviesApi.getMovieData(urlString: urlString, completion: completion);
    }
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var flutterViewController : FlutterViewController!;
    var navigationController : UINavigationController!;
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        flutterViewController = window?.rootViewController as? FlutterViewController
        GeneratedPluginRegistrant.register(with: self)
        navigationController = UINavigationController(rootViewController: flutterViewController)
        navigationController.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let api = MyApi()
        MoviesHostApiSetup.setUp(binaryMessenger: flutterViewController.binaryMessenger, api: api)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
