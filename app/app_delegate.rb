class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
  	application.statusBarHidden = true

  	@window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  	@window.rootViewController = RootViewController.alloc.init
  	@window.rootViewController.wantsFullScreenLayout = true
  	@window.makeKeyAndVisible
  end
end
