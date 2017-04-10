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
```
![](/images/example1.gif)


