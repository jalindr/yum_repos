#!/bin/sh

if [ -f ./yum.conf ] ; then
	if [ -f /etc/yum.conf.default ] ; then
		echo "/etc/yum.conf.default detected"
		echo "aborting.... clean this up yourself"
		exit
	fi
	echo "moving /etc/yum.conf to /etc/yum.conf.default"
	mv /etc/yum.conf /etc/yum.conf.default
	echo "Installing cleaner yum.conf"
	cp yum.conf /etc/yum.conf
fi

#if [ -d /etc/yum.repos.default ] ; then
#        echo "/etc/yum.repos.default detected"
#        echo "aborting.... clean this up yourself"
#        exit;
#fi

#echo "moving /etc/yum.repos.d to /etc/yum.repos.default"
#mv /etc/yum.repos.d /etc/yum.repos.default

#echo "Putting version tracked yum.repos.d in place"
#cp -r . /etc/yum.repos.d

echo "importing GPG keys ......"

WAIT=5

echo "in $WAIT seconds exit if u dont want this to happen"

I=$WAIT
while(($I > 0)); do
        echo -n "$I "
        sleep 1
        I=$(($I-1))
done
echo 0
sleep 1

for KEYFILE in *.repo.key; do
	echo "Inserting key from $KEYFILE"
	rpm --import $KEYFILE
done

echo "Done treat u r self with a espresso"