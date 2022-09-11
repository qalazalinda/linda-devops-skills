#! /bin/bash
touch  directories.list
ls -d */ >>  directories.list

sed -i "1s/^/line one's line\n/"   directories.list

head -n 3 directories.list

echo "please enter a interger number"
read integer

if ! [[ "$integer" =~ ^[0-9]+$ ]]
    then
        echo "Sorry integers only"
fi


for i in $integer
do
  head -n $i directories.list
done
