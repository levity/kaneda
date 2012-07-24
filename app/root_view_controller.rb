class RootViewController < UIViewController
	def loadView
		self.view = UIView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
	end

	def viewDidLoad
		self.view.backgroundColor = UIColor.whiteColor
		self.view.userInteractionEnabled = true

		kaneda = UIImageView.alloc.initWithImage(UIImage.imageNamed('kaneda.png'))
		self.view.addSubview(kaneda)
		kaneda.center = self.view.center
		kaneda.autoresizingMask = 
			UIViewAutoresizingFlexibleLeftMargin | 
			UIViewAutoresizingFlexibleRightMargin | 
			UIViewAutoresizingFlexibleTopMargin | 
			UIViewAutoresizingFlexibleBottomMargin

		# note the trailing colon in the selector
		tap = UITapGestureRecognizer.alloc.initWithTarget(self, action:'tapped:')
		self.view.addGestureRecognizer(tap)

		sound_url = NSURL.alloc.initFileURLWithPath(
			NSBundle.mainBundle.pathForResource('kaneda', ofType:'wav'))
		@player = AVAudioPlayer.alloc.initWithContentsOfURL(sound_url, error:nil)
		@player.instance_eval do # 1 <3 ruby
			def playing?
				isPlaying == 1
			end
		end
		@player.prepareToPlay
	end

	def shouldAutorotateToInterfaceOrientation(orientation)
		true
	end

	def tapped(sender)
		@player.play unless @player.playing?
	end
end