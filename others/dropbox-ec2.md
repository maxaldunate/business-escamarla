## DropBox to EC2


```bash
sudo su
yum update -y
wget -O dropbox.tar.gz "http://www.dropbox.com/download/?plat=lnx.x86_64"
tar -xvzf dropbox.tar.gz
.dropbox-dist/dropboxd &
```


### LogIn to link the
https://www.dropbox.com/cli_link_nonce?nonce=XXXXXXXXXXXXXXXXXXXXXXXXX