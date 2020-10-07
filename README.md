# 简单的AOP

```objc
id person = [[Person alloc] init];

// 设置代理中注册的选择器数组
NSValue *selValue = [NSValue valueWithPointer:@selector(play:andGame:)];
NSArray *selValues = @[selValue];

// 创建AuditingInvoker
AuditingInvoker *invoker = [[AuditingInvoker alloc] init];

// 创建 Person 对象的代理 personProxy
id personProxy = [[AspectProxy alloc] initWithObject:person selectors:selValues andInvoker:invoker];

// 使用指定的选择器向该代理发送消息---例子1
[personProxy play:@"Computer" andGame:@"LOL"];

// 使用还未注册到代理中的其他选择器，向这个代理发送消息！---例子2
[personProxy play:@"Switch" :@"Pokemon"];

// 为这个代理注册一个选择器并再次向其发送消息---例子3
[personProxy registerSelector:@selector(play::)];
[personProxy play:@"Switch" :@"Pokemon"];

```

例子1中会输出3句话

调用Person对象的代理中的study:andRead:方法，会使该代理调用AuditingInvoker对象中的preInvoker:方法、真正目标（Student对象）中的play:andGame方法，以及AuditingInvoker对象中的postInvoker:方法。

一个方法的调用，调用起了3个方法。原因是play:andGame:方法是通过Perosn对象的代理注册的；

例子2就只会输出1句话

调用Person对象代理中的play:方法，因为该方法还未通过这个代理注册，所以程序仅会将调用该方法的消息转发给Person对象，而不会调用AuditorInvoker方法。

例子3又会输出3句话了

因为play::通过这个代理进行了注册，然后程序再次调用它，在这次调用过程中，程序会调用AuditingInvoker对象中的AOP方法和真正目标（Person对象）中的play::方法。

这个例子就实现了一个简单的AOP(Aspect Oriented Programming)面向切面编程。

我们把一切功能"切"出去，与其他部分分开，这样可以提高程序的模块化程度。

AOP能解耦也能动态组装，可以通过预编译方式和运行期动态代理实现在不修改源代码的情况下给程序动态统一添加功能。

比如上面的例子三，我们通过把方法注册到动态代理类中，于是就实现了该类也能处理方法的功能。
