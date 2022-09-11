#!/bin/bash
## Create by PcLiu at 2022/01/25

########################################################################################
#####################          Install  Python  Env        #####################
########################################################################################

## Prepare System Env
if [ ! -f  "/usr/bin/vim" ] ;then
  apt-get update
  ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
  echo "Asia/Shanghai" > /etc/timezone
  apt-get install -y openssh-server openssh-client mysql-client curl jq net-tools lsof vim netcat gcc

  ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa -q
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
  chmod 600 ~/.ssh/authorized_keys
  echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config

  # For root login
  sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
  sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

  mkdir /opt/installs
  mkdir /opt/run
fi

chmod 755 /opt/*.sh


useradd -b /home -d /home/anaconda -p alex  -m -U anaconda
su -c 'wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh -O /home/anaconda/Anaconda3-2022.05-Linux-x86_64.sh' anaconda
chown anaconda:anaconda /home/anaconda/Anaconda3-2022.05-Linux-x86_64.sh
su -c 'bash /home/anaconda/Anaconda3-2022.05-Linux-x86_64.sh -b -p /home/anaconda/anaconda3' anaconda




