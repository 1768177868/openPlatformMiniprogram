 已迁移到 https://gitee.com/wangxuancheng/wechat_applet_management  
 
 
 # 微信第三方平台小程序管理


**申请的微信开放平台第三方平台配置填写以下信息**

授权事件接收 URL： 
```
域名/openPlatform/ticket
```

授权后实现业务

消息校验Token  weixin

消息与事件接收URL：  
```
域名/openPlatform/callback/$APPID$
```

在第三方平台创建审核通过后，微信服务器会每隔 10 分钟会向第三方的消息接收地址推送一次 component_verify_ticket，用于获取第三方平台接口调用凭据
出现 Component verify ticket does not exists. 错误检查配置是否正确，日志打印是否能正常接收到微信请求数据


**后台地址**
https://example.com/ZpQNKcLtFz.php  账号：admin  密码：12345678



配置 .env

常规管理 -》微信开放平台配置填写

导入 mysql.sql 到数据库

伪静态,nginx指向public根目录
```
location / {
	if (!-e $request_filename){
		rewrite  ^(.*)$  /index.php?s=$1  last;   break;
	}
}
```

![输入图片说明](public/assets/img/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20211202112418.png)
