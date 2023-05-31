#!/bin/bash /*menu*/
FECHA=$(date +"%Y-%m-%d")
SUSEConnect -p SLES_SAP/15.3/x86_64 -r $1
SUSEConnect -p sle-module-basesystem/15.3/x86_64
SUSEConnect -p PackageHub/15.3/x86_64
SUSEConnect -p SLES_SAP/15.3/x86_64 -r $1
SUSEConnect -p sle-module-legacy/15.3/x86_64
SUSEConnect -p sle-module-development-tools/15.3/x86_64
sudo zypper refresh
sudo zypper in -y krb5-client libgcc_s1 libstdc++6 libatomic1 insserv-compat glibc-i18ndata bc python python-openssl apache2 libpcap nfs-kernel-server xmlstarlet libicu60_2 libcap-progs
sudo zypper install -y rpm-build-4.14.3-150300.52.1
sudo zypper install -y cpulimit-2.5-bp153.1.16
sudo mkdir -p /hanainstallation
sudo chmod -R 777 
sudo unzip -d MHANA 51055068.ZIP 
sudo unzip -d SAPB1 B1H10002202HF1_1-70004122.ZIP 
mv SAPCAR_1115-70006178.EXE SAPCAR.EXE 
chmod -R 777 SAPCAR.EXE
cp SAPCAR.EXE /usr/sbin
cd "hanainstallation/DATA_UNITS/SAP HANA CLIENT 2.0 FOR B1/LINX64SUSE"
sudo ./SAPCAR.EXE -xvf IMDB_CLIENT20_004_171.SAR -manifest SIGNATURE
cd "/root/scripts/hanainstallation/DATA_UNITS/SAP HANA CLIENT 2.0 FOR B1/LINX64SUSE/SAP_HANA_CLIENT"
./hdbinst

  