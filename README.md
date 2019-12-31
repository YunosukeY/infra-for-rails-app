# infra-for-rails-app
このレポジトリは[rail-app](https://github.com/YunosukeY/rails-app)をAWS EC2上で動作させるためのインフラをコード化したものです。

## 使い方
1. Terraform
    1. 準備  
        variables.tfを編集してください  
        amiは更新されると思いますし、pubic-keyは筆者がSSHできるようになってしまうので必ず自分のものにしてください
    2. インフラを構築  
        成功するとインスタンスのIPが表示されます
        ```Shell
        $ cd terraform
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
        表示されたIPを使って接続してみます
        ```Shell
        $ ssh ubuntu@xxx.xxx.xxx.xxx
        The authenticity of host 'xxx.xxx.xxx.xxx (xxx.xxx.xxx.xxx)' can't be established.
        ECDSA key fingerprint is SHA256:...
        Are you sure you want to continue connecting (yes/no)? yes
        
        ...
        
        ubuntu@ip-yyy-yyy-yyy-yyy:~$ logout
        Connection to xxx.xxx.xxx closed.
        ```
2. Ansible
    1. 準備  
        対象ホストを指定します
        ```Shell
        $ echo 3.112.204.225 >> ../ansible/hosts
        ```
    2. Playbookを実行します
        ```Shell
        $ cd ../ansible
        $ ansible-playbook site.yml -i hosts
        
        ...
        
        PLAY RECAP **********************************************************************************************
        xxx.xxx.xxx.xxx              : ok=14   changed=7    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0 
        ```
    3. 確認  
        SSHしてDockerとDocker-Composeがインストールされていることを確認します
        ```Shell
        $ ssh ubuntu@xxx.xxx.xxx.xxx
        ubuntu@ip-yyy-yyy-yyy-yyy:~$ docker --version
        Docker version 19.03.5, build 633a0ea838
        ubuntu@ip-yyy-yyy-yyy-yyy:~$ docker-compose --version
        docker-compose version 1.24.1, build 4667896b
        ```
        これで完了です

## 壊し方
```Shell
$ cd terraform
$ terraform destroy

...

Plan: 0 to add, 0 to change, 9 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

...

Destroy complete! Resources: 9 destroyed.
```
