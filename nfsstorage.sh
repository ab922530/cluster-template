#!/bin/sh

yum install -y nfs-utils nfs-utils-lib
chkconfig nfs on
service rpcbind start
service nfs start
mkdir /users/jk880380/scratch
cp /local/repository/source/* /users/jk880380/scratch
echo "/users/jk880380/scratch 192.168.1.2(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/users/jk880380/scratch 192.168.1.3(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/users/jk880380/scratch 192.168.1.4(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/users/jk880380/scratch 192.168.1.5(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/users/jk880380/scratch 192.168.1.6(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/users/jk880380/scratch 192.168.1.7(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/users/jk880380/scratch 192.168.1.8(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/users/jk880380/scratch 192.168.1.9(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/users/jk880380/scratch 192.168.1.10(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/users/jk880380/scratch 192.168.1.11(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/users/jk880380/scratch 192.168.1.12(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/users/jk880380/scratch 192.168.1.13(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/users/jk880380/scratch 192.168.1.14(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
exportfs -a
sleep 600
mkdir /software
#mount -t nfs 192.168.1.1:/users/jk880380/software /software
mount -t nfs 192.168.1.1:/software /software
echo "Done" >> /users/jk880380/storagedone.txt

while [ ! -d /software/flagdir ]
do
  sleep 30
done

echo "export PATH='$PATH:/software/bin'" >> /users/jk880380/.bashrc
echo "export LD_LIBRARY_PATH='$LD_LIBRARY_PATH:/software/lib/'" >> /users/jk880380/.bashrc
source /users/jk880380/.bashrc

echo "Done" >> /users/jk880380/storagedoneMPI.txt
