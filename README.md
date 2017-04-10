# BouncingAnimation
This is a bouncing animation on iOS platform written in objective-c.And it's merely a 2D animation, which is not working in 3D transform.  
The whole project is a sample project with the animation components(BouncingAnimation.h/.m).

## Install
### Cocoapods
Add code below to your Podfile, and change 'Myapp' to your target name:
```
target 'MyApp' do
pod 'BouncingAnimation', '~> 1.0.0'
end
```
Then run `pod install` in your terminal.  
### Source code
Download the project here and drag the `BouncingAnimation.h/.m` files to your project.  

After adding BouncingAnimation into your project, you can simply import `BouncingAnimation.h` to use it.  

## How to use it?
Use the public factory method to create custom bouncing animation. Here are some examples:  
```objc
	CATransform3D fromt = CATransform3DIdentity;
	CATransform3D tot = CATransform3DMakeScale(2, 2, 1);
    
	BouncingAnimation *anim = [BouncingAnimation animationWithKeypath:@"transform"
                                                            fromValue:[NSValue valueWithCATransform3D:fromt]
                                                              toValue:[NSValue valueWithCATransform3D:tot]];

	[view.layer addAnimation:anim forKey:@""];                   
```

![](/images/example1.gif)  

```objc
	CGFloat fromf = _view.layer.position.x;
	CGFloat tof = fromf - _view.bounds.size.width;
    
	BouncingAnimation *anim = [BouncingAnimation animationWithKeypath:@"position.x"
                                                            fromValue:[NSNumber numberWithFloat:fromf]
                                                              toValue:[NSNumber numberWithFloat:tof]];
                                                              
	[view.layer addAnimation:anim forKey:@""];   
```

![](/images/example2.gif)  

```objc
	CGRect fromr = _view.layer.frame;
	CGRect tor = CGRectInset(fromr, 10, 10);
    
	BouncingAnimation *anim = [BouncingAnimation animationWithKeypath:@"bounds"
                                                            fromValue:[NSValue valueWithCGRect:fromr]
                                                              toValue:[NSValue valueWithCGRect:tor]];
                                                              
	[view.layer addAnimation:anim forKey:@""];   
```

![](/images/example3.gif)  

With these simply setup, you are free to go with a bouncing animation on your view.  

## License
This code is distributed under the terms and conditions of the [MIT license](/LICENSE).



