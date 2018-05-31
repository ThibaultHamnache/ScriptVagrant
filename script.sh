#! /bin/bash

COLOR='\033[1;34m'
NC='\033[0m'
# No Color

read -p "Choisissez un nom pour le dossier de votre Vagrant : " name

read -p "Choisissez un nom pour le dossier de synchronisation de votre Vagrant : " sync

    options=("xenial64" "xenial64")
    echo -e "${COLOR}Sélectionnez une version d'Ubuntu ${NC}"

    select ubuntuVersion in "${options[@]}";do

        case ${ubuntuVersion} in

            xenial64 ) choiceVersion="xenial64";break;;
            xenial64 ) choiceVersion="xenial64";break;;

        esac

    done
echo -e "${COLOR}Création du dossier : $name ${NC}"
mkdir $name
cd $name
pwd
sleep 1
echo -e "${COLOR}Création du dossier de synchronisation${NC}"
mkdir $sync
sleep 1
echo -e "${COLOR}Copie du script install.sh dans data ${NC}"
cp ../install.sh ../$name/$sync
sleep 2
vagrant init

sed -i '15s/base/ubuntu\/'"${choiceVersion}"'/' Vagrantfile
sed -i '35s/#//' Vagrantfile
sed -i '46s/#//' Vagrantfile
sed -i '46s/..\/data/.\/'"${sync}"'/' Vagrantfile
sed -i '46s/\/vagrant_data/\/var\/www\/html/' Vagrantfile

sleep 2
vagrant up
sleep 2
echo -e "${COLOR}Connexion SSH en cours.. ${NC}"
echo -e "${COLOR}Un fois connecter veuillez vous diriger ver /var/www/html afin de lancer le fichier install.sh ${NC}"
sleep 2
vagrant ssh
