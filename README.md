# Swift-OC-Mixed

### Description

* Swift Pod, OC Pod and Swift-OC-Mixed Pod managed through CocoaPods

* Componentized(Modularity) management.

### 准备工作
* Swift VS Objective-C 两者之间的语言特性不同了解一下。其中重点了解一下Runtime
	* [Swift与OC的运行时特性](https://leejnull.github.io/2020/01/03/2020-01-03-01/)
	* [Swift vs OC](https://www.upwork.com/resources/swift-vs-objective-c-a-look-at-ios-programming-languages#:~:text=Swift%20is%20easier%20to%20read,has%20a%20more%20clunky%20syntax.&text=Also%2C%20Swift%20requires%20less%20code,interpolation%2C%20without%20placeholders%20or%20tokens.)

* 苹果官方开发文档，关于 Swift-OC 混编引用问题。注意两个方面：1.App-Target内 2.静态库内
	* [Importing Swift into Objective-C](https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/importing_swift_into_objective-c)
	* [Importing Objective-C into Swift](https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/importing_objective-c_into_swift)

* Swift 静态库，OC静态库，Swift-OC静态库的制作相关。这个需要重点看，在制作Pod的时候，很多东西都是根据这里的步骤来找到答案
	* [Swift Objective C interoperability, Static Libraries, Modulemap etc…](https://medium.com/@mail2ashislaha/swift-objective-c-interoperability-static-libraries-modulemap-etc-39caa77ce1fc)

* CocoaPods的使用相关
	* PodFile
		* ```use_modular_headers``` <br> </br> 
		```pod 'SSZipArchive', :modular_headers => true```
		<br> </br> 
		
		* ```use_frameworks!``` <br> </br> 
		```use_frameworks! :linkage => :dynamic```
	   ```use_frameworks! :linkage => :static```
		
		* post_install hook target build setting

	* PodSpec 
		* dependency
		```spec.dependency 'AFNetworking', '~> 1.0', :configurations => ['Debug']```
		
		* script_phase

### 踩坑之处
* modular_headers
	* 因为Swift调用OC，如果是同一Module模块，可以通过module-swift.h为了省去这一个引用过程，可以结合Pod配置module的Header Search Path，将build后的module-swift.h自动拷贝一份到Pod/Header/Module里面。见PodSpec脚本配置
	*  引用其他OC Pod，需要在PodFile文件中配置好 modular_headers
	*  引用其他Swift Pod 需要设置 modueName。如果不生效，可以结合实际情况 配置dependency

* framework
	* Swift-OC-Mix Pod 会引用到其他 framework，但是索引不到对应的ModuleName，需配置dependency
	* 如果PodFile使用use_frameworks! 会有动态库加载过慢导致App启动慢的问题
	* static libraries bundle source 素材加载失败

* static libraries
	*  Public Header 暴露的问题

* ModuleName
	* import <ModuleName/xxx.h> not found 
	* 检查被Swift引用的Module是否进行了modular_headers
	* 尝试添加dependency

* umbrella Pod生成文件引用所有OC.h 编译缓慢
* module-Swift.h 文件 报错 <ModuleName/ModuleName.h> not found xcode bug，自己新建一个对应头文件，将Swift需要用到的.h添加进入，或者 

```
#if __has_include("moduleName-umbrella.h")
#import "moduleName-umbrella.h"
#endif
```

* App-Target Build Settings

* 大量头文件错误 
```
import "xxx.h" -> import "<moduleName/xxx.h>"
```
* 访问不到 Swift 相关 Class、Property、Function、typedefine
```
@objcMembers,public var, public class, public func, public typealias
```
* duplicate symbol
	* 全局变量的重复引用、无用的全局变量
	* App-Target compile Source 重复引用了编译文件

* 未能识别 id <xxxDelegate> delegate，typedefine
	* 重复的 Protocol 定义
	* 重复的 枚举