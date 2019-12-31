# infra-for-rails-app
このレポジトリは[rail-app](https://github.com/YunosukeY/rails-app)をAWS EC2上で動作させるためのインフラをコード化したものです。

## 使い方
1. Terraform
    1. 準備  
    variables.tfを編集してください  
    amiは更新されると思いますし、pubic-keyは筆者がsshできるようになってしまうので必ず自分のものにしてください
    2. インフラを構築  
    成功するとインスタンスのIPが表示されます
    ```Shell
    $ terraform init
    
    Terraform has been successfully initialized!
    
    You may now begin working with Terraform. Try running "terraform plan" to see
    any changes that are required for your infrastructure. All Terraform commands
    should now work.
    
    If you ever set or change modules or backend configuration for Terraform,
    rerun this command to reinitialize your working directory. If you forget, other
    commands will detect it and remind you to do so if necessary.
    
    $ terraform plan
    
    ...
    
    Plan: 9 to add, 0 to change, 0 to destroy.
    
    ------------------------------------------------------------------------
    
    Note: You didn't specify an "-out" parameter to save this plan, so Terraform
    can't guarantee that exactly these actions will be performed if
    "terraform apply" is subsequently run.

    $ terraform apply
    
    ...
    
    Plan: 9 to add, 0 to change, 0 to destroy.
    
    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.
    
      Enter a value: yes
    
    ...
   
    Apply complete! Resources: 9 added, 0 changed, 0 destroyed.
    
    Outputs:
    
    instance-ip = xxx.xxx.xxx.xxx
    ```

    3. 確認   
    表示されたIPを使ってssh接続
    ```Shell
    $ ssh ubuntu@xxx.xxx.xxx.xxx
    The authenticity of host 'xxx.xxx.xxx.xxx (xxx.xxx.xxx.xxx)' can't be established.
    ECDSA key fingerprint is SHA256:...
    Are you sure you want to continue connecting (yes/no)? yes
    
    ...
    
    ubuntu@ip-yyy-yyy-yyy-yyy:~$ 
    ```

## 壊し方
```Shell
$ terraform destroy
var.access-key
  Enter a value: hoge

var.secret-key
  Enter a value: piyo

...

Plan: 0 to add, 0 to change, 9 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

...

Destroy complete! Resources: 9 destroyed.
```
