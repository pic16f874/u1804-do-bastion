# сервера и группы описаны файле ./hosts
#
# общие переменные помещены в файл 
#     ./group_vars/all/main.yml
# переменные относящиеся к конкретному серверу помещены 
#     ./host_vars/ans_servername/ans_servername.yml
#
#sudo /home/kivanov/.local/bin/pip install dopy
#sudo /home/kivanov/.local/bin/pip install 

##### on target machine
#sudo apt install python-pip
#pip install PyMySQL
#####

#перечень серверов, на которые будет выкладываться mdm
#указан в переменной ANSHOSTS (localhost присутствует всегда)

# select one line with ANSHOSTS
# here used ans_hosts from ./hosts file
#ANSHOSTS="localhost:demo:sho-mdm01" &&\
#ANSHOSTS="localhost:sho-mdm01" &&\

# T O  D O  - use Ansible Vault to store passwords
ANSHOSTS="localhost:bast-host" &&\
ansible-playbook -i hosts -l ${ANSHOSTS} 01-create_users.yml
ansible-playbook -i hosts -l ${ANSHOSTS} 03-bkp-rst_webst.yml --become &&

ANSIBLE_HOST_KEY_CHECKING=False && ansible-playbook cr-droplet.yml
