# WQAlertView
自定义的网络状态提示框
这是我第一次在github上上传自己写的代码，水平有限写的很简单
之前做项目，非常苦恼于网络状态的提示，使用系统自带的提示框会出现重复弹框的现象后来似乎明白是由于同级的关系，加上在每个VC
上加了相同的观察者所以状态一改变每个vc都会弹一次，但是系统的提示框我觉得与我的app不够和谐所以就自己写了一个提示框，目前
只是用于网络状态的提示


使用方法：

[WQAlertView showConnectWWAN];//网络状态为移动网络
[WQAlertview showConnectWifi];//网络状态为wifi
[WQAlertView showNotNetwork];//网络状态为无网络
