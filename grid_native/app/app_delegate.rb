p "UIScrollViewDecelerationRateNormal"
p UIScrollViewDecelerationRateNormal


class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    @window.rootViewController = GridScrollingController.alloc.initWithNibName(nil, bundle: nil)
    true
  end
end