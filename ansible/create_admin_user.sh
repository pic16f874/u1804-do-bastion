############################################################
ssh -i "~/.ssh/id_rsa" root@u1804-bast "adduser pic16f874"
############################################################

kivanov@hp5320:~/git/u1804-bast-do/ansible$ ssh -i "~/.ssh/id_rsa" root@u1804-bast "adduser pic16f874"
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
	LANGUAGE = (unset),
	LC_ALL = (unset),
	LC_MEASUREMENT = "ru_RU.UTF-8",
	LC_PAPER = "ru_RU.UTF-8",
	LC_MONETARY = "ru_RU.UTF-8",
	LC_NAME = "ru_RU.UTF-8",
	LC_ADDRESS = "ru_RU.UTF-8",
Adding user `pic16f874' ...
Adding new group `pic16f874' (1000) ...
Adding new user `pic16f874' (1000) with group `pic16f874' ...
Creating home directory `/home/pic16f874' ...
Copying files from `/etc/skel' ...
	LC_NUMERIC = "ru_RU.UTF-8",
	LC_TELEPHONE = "ru_RU.UTF-8",
	LC_IDENTIFICATION = "ru_RU.UTF-8",
	LC_TIME = "ru_RU.UTF-8",
	LANG = "C.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to a fallback locale ("C.UTF-8").
Enter new UNIX password: microchip16
Retype new UNIX password: microchip16
passwd: password updated successfully
Changing the user information for pic16f874
Enter the new value, or press ENTER for the default
	Full Name []: 
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 

Is the information correct? [Y/n] kivanov@hp

############################################################
ssh -i "~/.ssh/id_rsa" root@u1804-bast "usermod -aG sudo pic16f874"
############################################################
# TARGETHOST
# ADMINUSER
# SSHKEYPATH
#     засылаем открытый ключ польз-лю 

ssh -i "~/.ssh/id_rsa" root@u1804-bast "sudo mkdir -p /home/pic16f874/.ssh/"
scp -i "~/.ssh/id_rsa" ~/.ssh/id_rsa.pub  root@u1804-bast:/home/pic16f874/.ssh/authorized_keys

#выставляем ему права
ssh -i "~/.ssh/id_rsa" root@u1804-bast "sudo chown -R pic16f874: /home/pic16f874/.ssh"
ssh -i "~/.ssh/id_rsa" root@u1804-bast "sudo chmod -R 600        /home/pic16f874/.ssh"
ssh -i "~/.ssh/id_rsa" root@u1804-bast "sudo chmod    700        /home/pic16f874/.ssh"



#разрешаем ему sudo без пароля
ssh -i ".ssh/mdm-demo.pem" ec2-user@aws-sugar "sudo echo \"kanoadmin ALL = NOPASSWD: ALL\" > kano-user"
ssh -i ".ssh/mdm-demo.pem" ec2-user@aws-sugar "sudo echo \"kanoadmin ALL=(ALL) NOPASSWD:ALL\" >> kano-user"
ssh -i ".ssh/mdm-demo.pem" ec2-user@aws-sugar "sudo cp kano-user /etc/sudoers.d/"
ssh -i ".ssh/mdm-demo.pem" ec2-user@aws-sugar "sudo chmod 440 /etc/sudoers.d/kano-user"

#пробуем войти в систему под новым пользователем

ssh -i ".ssh/aws-key1" kanoadmin@aws-sugar
sudo -i
