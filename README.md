# terraform-rails-app
このレポジトリは[rail-app](https://github.com/YunosukeY/rails-app)をAWS EC2上で動作させるためのインフラをコード化したものです。

## 使い方
1. 準備  
  variables.tfを編集してください  
  amiは更新されると思いますし、pubic-keyは筆者がsshできるようになってしまうので必ず自分のものにしてください

2. インフラを構築  
  成功するとインスタンスのIPが表示されます
```Shell
$ terraform apply
var.access-key
  Enter a value: hoge

var.secret-key
  Enter a value: piyo

...

Plan: 8 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

...

Apply complete! Resources: 8 added, 0 changed, 0 destroyed.

Outputs:

instance-ip = xxx.xxx.xxx.xxx
```

3. 接続  
  表示されたIPを使ってssh接続
```Shell
$ ssh ubuntu@xxx.xxx.xxx.xxx
The authenticity of host 'xxx.xxx.xxx.xxx (xxx.xxx.xxx.xxx)' can't be established.
ECDSA key fingerprint is SHA256:...
Are you sure you want to continue connecting (yes/no)? yes

...

ubuntu@ip-yyy-yyy-yyy-yyy:~$ 
```
