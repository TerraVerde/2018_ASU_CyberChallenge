#!/bin/bash
#########################################
# Setup linux_challenge standalone script
#########################################

# Install dependencies
apt-get install -y python2.7 gcc

# Challenge User setup:
adduser --disabled-password --gecos "" loginuser
echo "loginuser:loginuser" | chpasswd

# User: admin
# Make SUID bit challenge directories
adduser --disabled-password --gecos "" admin
mkdir /home/admin/secret_docs
mkdir -p /usr/share/scripts/admin/testing/text-editors
mkdir -p /usr/share/scripts/admin/testing/utilities
mkdir -p /usr/share/scripts/admin/work-in-progress
mkdir -p /usr/share/scripts/admin/complete
mkdir -p /usr/share/scripts/root/
mkdir -p /usr/share/scripts/loginuser/
# Set permissions
chown -R admin:admin /usr/share/scripts/admin
chown -R loginuser:loginuser /usr/share/scripts/loginuser

# User: root
# Make script directories
mkdir /scripts
# Set script directory permissions
chown root:root /scripts
chmod 700 /scripts
#Create checkflags.sh
echo 'IyEvYmluL2Jhc2gKCkNIQUxfVVNFUj1sb2dpbnVzZXIKRkxBR1M9L2hvbWUvJENIQUxfVVNFUi9m
bGFncy50eHQKV0FMRE89L3Vzci9zaGFyZS9pY29ucy9sb2NvbG9yLzMyeDMyL2FwcHMvd2FsZG8K
UFJPQz0vc2NyaXB0cy9teXNlcnZpY2UucHkKCiMgU2V0dXAgY2hhbGxlbmdlCgojIENyZWF0ZSBm
bGFnIGZpbGUKaWYgWyAhIC1mICRGTEFHUyBdCiAgdGhlbgogICAgcHJpbnRmICIjQ3liZXJDaGFs
bGVuZ2UgMjAxOCBMaW51eCBDaGFsbGVuZ2UgRmxhZyBGaWxlXG4jQ2hlY2sgYmFjayBpbiB0aGlz
IGZpbGUgdG8gc2VlIGlmIHlvdSBnb3QgbmV3IG9uZXMhXG4iID4gJEZMQUdTCmZpCgojIEhpZGUg
d2FsZG8KaWYgWyAhIC1hIHdhbGRvIF0KICB0aGVuCiAgICB0b3VjaCAkV0FMRE8KICAgIGNob3du
ICRDSEFMX1VTRVI6JENIQUxfVVNFUiAkV0FMRE8KZmkKCiMgU3RhcnQgbXlzZXJ2aWNlLnB5Cmlm
IFsgJChwcyBhdXggfCBncmVwICJteXNlcnZpY2UucHkiIHwgd2MgLWwpIC1sdCAyIF0KICB0aGVu
CiAgICBub2h1cCAvdXNyL2Jpbi9weXRob24yLjcgJFBST0MgJiAmPi9kZXYvbnVsbApmaQoKIyBD
aGVjayBmb3IgdGFzayBjb21wbGV0aW9uCgojIEZsYWcxOiBMb2dnaW5nIGluIHZpYSBTU0gKaWYg
WyAkKGdyZXAgJ1czbGNvbTNUb1RoM0p1bmdsMy4nICRGTEFHUyB8IHdjIC1sICkgPT0gMCBdCiAg
dGhlbgogICAgZWNobyAiRmxhZzE6IFczbGNvbTNUb1RoM0p1bmdsMy4iID4+ICRGTEFHUwpmaQoK
IyBGbGFnMjogQWRkaW5nIHlvdXIgU1NIIEtleQppZiBbIC1hIC9ob21lLyRDSEFMX1VTRVIvLnNz
aC9hdXRob3JpemVkX2tleXMgXQogIHRoZW4KICAgIGlmIFsgJChncmVwICJMb29rTTROb1A0NTVX
b1JENSEiICRGTEFHUyB8IHdjIC1sICkgPT0gMCBdCiAgICAgIHRoZW4KICAgICAgICBlY2hvICJG
bGFnMjogTG9va000Tm9QNDU1V29SRDUhIiA+PiAkRkxBR1MKICAgIGZpCmZpCgojRmxhZzM6IEFk
ZCBhIGN1c3RvbSBsb2dvbiBiYW5uZXIgZm9yIHlvdXIgbG9nb24gdXNlcgppZiBbICQoZ3JlcCAt
UCAiKGVjaG98cHJpbnRmPykgXFcrV2VsY29tZSBiYWNrISBJdCBpcyBcVytkYXRlXFcrIiAvaG9t
ZS8kQ0hBTF9VU0VSLy5iYXNocmMgfCB3YyAtbCApIC1ndCAwIF0KICB0aGVuCiAgICBpZiBbICQo
Z3JlcCAiV2g0dDR3NHJtVzNsY29tMz8iICRGTEFHUyB8IHdjIC1sICkgPT0gMCBdCiAgICAgIHRo
ZW4KICAgICAgICBlY2hvICJGbGFnMzogV2g0dDR3NHJtVzNsY29tMz8iID4+ICRGTEFHUwogICAg
ZmkKZmkKCiMgRmxhZzQ6IEZpbmQgd2FsZG8KaWYgWyAkKGNhdCAkV0FMRE8gfCB3YyAtbCkgLWd0
IDAgXQogIHRoZW4KICAgIGlmIFsgJChncmVwICI/Tm93V2gzcjNJNUM0cm0zbj8iICRGTEFHUyB8
IHdjIC1sICkgPT0gMCBdCiAgICAgIHRoZW4KICAgICAgICBlY2hvICJGbGFnNDogP05vd1doM3Iz
STVDNHJtM24/IiA+PiAkRkxBR1MKICAgIGZpCmZpCgojIEZsYWc1OiBDb25uZWN0IHRvIHRoZSBw
b3J0IHRoZSBwcm9jZXNzIGlzIGxpc3RlbmluZyBvbgojIFRoaXMgaXMgZG9uZSBieSB0aGUgbXlz
ZXJ2aWNlLnB5IHNjcmlwdAoKIyBGbGFnNjogR3Vlc3MgdGhlIG51bWJlciBiZXR3ZWVuIDEgYW5k
IDEwMDAKIyBUaGlzIGlzIGRvbmUgYnkgdGhlIG15c2VydmljZS5weSBzY3JpcHQKCiMgRmxhZzc6
IFNVSUQgYml0LCB0ZWQgcHJvZ3JhbQojIEZsYWcgaW5zaWRlIGZpbGUgL2hvbWUvYWRtaW4vc2Vj
cmV0X2RvY3MvZmxhZy50eHQKCiMgRmxhZzg6IFNVSUQgQml0LCBhZG1pbl9scwppZiBbICQobHMg
LTEgL2hvbWUvYWRtaW4vc2VjcmV0X2RvY3MvZmxhZzkudHh0IDI+L2Rldi9udWxsIHwgd2MgLWwp
IC1lcSAxIF0KICB0aGVuCiAgICBpZiBbICQoZ3JlcCAiTm90NW9DbDN2M3I0cjNXMz8iICRGTEFH
UyB8IHdjIC1sICkgPT0gMCBdCiAgICAgIHRoZW4KICAgICAgICBlY2hvICJGbGFnODogTm90NW9D
bDN2M3I0cjNXMz8iID4+ICRGTEFHUwogICAgZmkKZmkK' | base64 -d > /scripts/checkflags.sh
chmod 770 /scripts/checkflags.sh

# Flag5 and Flag6 setup
# Create myservice.py
echo 'IyEvdXNyL2Jpbi9weXRob24yLjcKIyAtKi0gY29kaW5nOiBVVEYtOCAtKi0KCmltcG9ydCBTb2Nr
ZXRTZXJ2ZXIKCmNsYXNzIE15VENQSGFuZGxlcihTb2NrZXRTZXJ2ZXIuQmFzZVJlcXVlc3RIYW5k
bGVyKToKICAgICIiIgogICAgVGhlIHJlcXVlc3QgaGFuZGxlciBjbGFzcyBmb3Igb3VyIHNlcnZl
ci4KCiAgICBJdCBpcyBpbnN0YW50aWF0ZWQgb25jZSBwZXIgY29ubmVjdGlvbiB0byB0aGUgc2Vy
dmVyLCBhbmQgbXVzdAogICAgb3ZlcnJpZGUgdGhlIGhhbmRsZSgpIG1ldGhvZCB0byBpbXBsZW1l
bnQgY29tbXVuaWNhdGlvbiB0byB0aGUKICAgIGNsaWVudC4KICAgICIiIgoKICAgIGRlZiBoYW5k
bGUoc2VsZik6CiAgICAgICAgIyBzZWxmLnJlcXVlc3QgaXMgdGhlIFRDUCBzb2NrZXQgY29ubmVj
dGVkIHRvIHRoZSBjbGllbnQKICAgICAgICBzZWxmLmRhdGEgPSBzZWxmLnJlcXVlc3QucmVjdigx
MDI0KS5zdHJpcCgpCiAgICAgICAgcHJpbnQoInt9IHdyb3RlIHN0cmluZzoiLmZvcm1hdChzZWxm
LmNsaWVudF9hZGRyZXNzWzBdKSkKICAgICAgICBpZiBzZWxmLmRhdGEgPT0gIkhFTExPIjoKICAg
ICAgICAgICAgcHJpbnQoc2VsZi5kYXRhKQogICAgICAgICAgICBpZiAnSDNyMzU0NXRpY2szcjRV
Pycgbm90IGluIG9wZW4oJy9ob21lL2xvZ2ludXNlci9mbGFncy50eHQnKS5yZWFkKCk6CiAgICAg
ICAgICAgICAgICB3aXRoIG9wZW4oIi9ob21lL2xvZ2ludXNlci9mbGFncy50eHQiLCAiYSIpIGFz
IG15ZmlsZToKICAgICAgICAgICAgICAgICAgICBteWZpbGUud3JpdGUoIkZsYWc1OiBIM3IzNTQ1
dGljazNyNFU/XG4iKQogICAgICAgICAgICBzZWxmLnJlcXVlc3Quc2VuZGFsbCgiWW91IGRpZCBp
dCEgSGF2ZSBhIHN0aWNrZXIuXG4iKwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
4paR4paR4paR4paR4paR4paR4paR4paR4paR4paE4paR4paR4paR4paR4paR4paR4paR4paR4paR
4paR4paR4paR4paR4paR4paEXG4iICsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IuKWkeKWkeKWkeKWkeKWkeKWkeKWkeKWkeKWjOKWkuKWiOKWkeKWkeKWkeKWkeKWkeKWkeKWkeKW
keKWkeKWkeKWkeKWhOKWgOKWkuKWjFxuIiArCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICLilpHilpHilpHilpHilpHilpHilpHilpHilozilpLilpLilojilpHilpHilpHilpHilpHi
lpHilpHilpHiloTiloDilpLilpLilpLilpBcbiIgKwogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAi4paR4paR4paR4paR4paR4paR4paR4paQ4paE4paA4paS4paS4paA4paA4paA4paA
4paE4paE4paE4paA4paS4paS4paS4paS4paS4paQXG4iICsKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIuKWkeKWkeKWkeKWkeKWkeKWhOKWhOKWgOKWkuKWkeKWkuKWkuKWkuKWkuKW
kuKWkuKWkuKWkuKWkuKWiOKWkuKWkuKWhOKWiOKWkuKWkFxuIiArCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICLilpHilpHilpHiloTiloDilpLilpLilpLilpHilpHilpHilpLilpLi
lpLilpHilpHilpHilpLilpLilpLiloDilojilojiloDilpLiloxcbiIgKwogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAi4paR4paR4paQ4paS4paS4paS4paE4paE4paS4paS4paS4paS
4paR4paR4paR4paS4paS4paS4paS4paS4paS4paS4paA4paE4paS4paS4paMXG4iICsKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIuKWkeKWkeKWjOKWkeKWkeKWjOKWiOKWgOKWkuKW
kuKWkuKWkuKWkuKWhOKWgOKWiOKWhOKWkuKWkuKWkuKWkuKWkuKWkuKWkuKWiOKWkuKWkFxuIiAr
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICLilpHilpDilpHilpHilpHilpLilpLi
lpLilpLilpLilpLilpLilpLilozilojilojiloDilpLilpLilpHilpHilpHilpLilpLilpLiloDi
loTiloxcbiIgKwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi4paR4paM4paR4paS
4paE4paI4paI4paE4paS4paS4paS4paS4paS4paS4paS4paS4paS4paR4paR4paR4paR4paR4paR
4paS4paS4paS4paS4paMXG4iICsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIuKW
jOKWkuKWgOKWkOKWhOKWiOKWhOKWiOKWjOKWhOKWkeKWgOKWkuKWkuKWkeKWkeKWkeKWkeKWkeKW
keKWkeKWkeKWkeKWkeKWkuKWkuKWkuKWkFxuIiArCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICLilpDilpLilpLilpDiloDilpDiloDilpLilpHiloTiloTilpLiloTilpLilpLilpLi
lpLilpLilpLilpHilpLilpHilpLilpHilpLilpLilpLilpLiloxcbiIgKwogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAi4paQ4paS4paS4paS4paA4paA4paE4paE4paS4paS4paS4paE
4paS4paS4paS4paS4paS4paS4paS4paS4paR4paS4paR4paS4paR4paS4paS4paQXG4iICsKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIuKWkeKWjOKWkuKWkuKWkuKWkuKWkuKWkuKW
gOKWgOKWgOKWkuKWkuKWkuKWkuKWkuKWkuKWkeKWkuKWkeKWkuKWkeKWkuKWkeKWkuKWkuKWkuKW
jFxuIiArCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICLilpHilpDilpLilpLilpLi
lpLilpLilpLilpLilpLilpLilpLilpLilpLilpLilpLilpHilpLilpHilpLilpHilpLilpLiloTi
lpLilpLilpBcbiIgKwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi4paR4paR4paA
4paE4paS4paS4paS4paS4paS4paS4paS4paS4paS4paS4paS4paR4paS4paR4paS4paR4paS4paE
4paS4paS4paS4paS4paMXG4iICsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIuKW
keKWkeKWkeKWkeKWgOKWhOKWkuKWkuKWkuKWkuKWkuKWkuKWkuKWkuKWkuKWkuKWhOKWhOKWhOKW
gOKWkuKWkuKWkuKWkuKWhOKWgFxuIiArCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICLilpHilpHilpHilpHilpHilpHiloDiloTiloTiloTiloTiloTiloTiloDiloDiloDilpLilpLi
lpLilpLilpLiloTiloTiloBcbiIgKwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
4paR4paR4paR4paR4paR4paR4paR4paR4paR4paS4paS4paS4paS4paS4paS4paS4paS4paS4paS
4paA4paAXG4iICsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIllvdXIgZmxhZyBp
cyBpbiB0aGUgZmxhZ3MudHh0IGZpbGVcblxuIikKICAgICAgICBpZiBzZWxmLmRhdGEgPT0gIjY0
MiI6CiAgICAgICAgICAgIHByaW50KCJ7fSB3cm90ZSBpbnQ6Ii5mb3JtYXQoc2VsZi5jbGllbnRf
YWRkcmVzc1swXSkpCiAgICAgICAgICAgIHByaW50KHNlbGYuZGF0YSkKICAgICAgICAgICAgaWYg
J1lvdUd1MzU1ZWRJdCExITExIScgbm90IGluIG9wZW4oJy9ob21lL2xvZ2ludXNlci9mbGFncy50
eHQnKS5yZWFkKCk6CiAgICAgICAgICAgICAgICB3aXRoIG9wZW4oIi9ob21lL2xvZ2ludXNlci9m
bGFncy50eHQiLCAiYSIpIGFzIG15ZmlsZToKICAgICAgICAgICAgICAgICAgICBteWZpbGUud3Jp
dGUoIkZsYWc2OiBZb3VHdTM1NWVkSXQhMSExMSFcbiIpCiAgICAgICAgICAgIHNlbGYucmVxdWVz
dC5zZW5kYWxsKCJZb3UndmUgY3JhY2tlZCBpdCEgVGhlIG51bWJlciB3YXMgNjQyIVxuIisKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIllvdXIgZmxhZyBpcyBpbiB0aGUgZmxhZ3Mu
dHh0IGZpbGVcblxuIikKCmlmIF9fbmFtZV9fID09ICJfX21haW5fXyI6CiAgICBIT1NULCBQT1JU
ID0gImxvY2FsaG9zdCIsIDk5ODgKCiAgICAjIENyZWF0ZSB0aGUgc2VydmVyLCBiaW5kaW5nIHRv
IGxvY2FsaG9zdCBvbiBwb3J0IDk5OTkKICAgIHNlcnZlciA9IFNvY2tldFNlcnZlci5UQ1BTZXJ2
ZXIoKEhPU1QsIFBPUlQpLCBNeVRDUEhhbmRsZXIpCgogICAgIyBBY3RpdmF0ZSB0aGUgc2VydmVy
OyB0aGlzIHdpbGwga2VlcCBydW5uaW5nIHVudGlsIHlvdQogICAgIyBpbnRlcnJ1cHQgdGhlIHBy
b2dyYW0gd2l0aCBDdHJsLUMKICAgIHNlcnZlci5zZXJ2ZV9mb3JldmVyKCkK' | base64 -d > /scripts/myservice.py
chmod 770 /scripts/myservice.py

# Flag7 and Flag8 setup
mkdir -p /home/admin/secret_docs/
echo "Flag7: Th3y'llN3v3rF1ndTh3LoopHol3" > /home/admin/secret_docs/flag.txt
chown -R admin:admin /home/admin/secret_docs
chmod -R 770 /home/admin/secret_docs
cp /usr/bin/less /usr/share/scripts/admin/testing/text-editors/ted
chown admin:admin /usr/share/scripts/admin/testing/text-editors/ted
chmod 4551 /usr/share/scripts/admin/testing/text-editors/ted
echo 'I2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN0cmluZy5o
PgojaW5jbHVkZSA8dW5pc3RkLmg+CgppbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNo
YXIgKiplbnYpCnsKICAgIGludCBpPTA7CiAgICBjaGFyICpjbWQ7d2hpbGUgKGVudltpXSAhPSBO
VUxMKQogICAgewogICAgICAgIGlmICghc3RyY21wKHN0cnNlcCgmZW52W2ldLCI9IiksIkxTX1BB
VEgiKSkKICAgICAgICB7CiAgICAgICAgICAgIGNtZD1tYWxsb2Moc3RybGVuKGVudltpXSkrMjAp
OwogICAgICAgICAgICBpZiAoY21kPT1OVUxMKSBleGl0KDEpOwogICAgICAgICAgICBzcHJpbnRm
KGNtZCwiJXMvbXlzY3JpcHQiLGVudltpXSk7CiAgICAgICAgICAgIGludCByZWFsID0gZ2V0dWlk
KCk7CiAgICAgICAgICAgIGludCBldWlkID0gZ2V0ZXVpZCgpOwogICAgICAgICAgICBzZXRyZXVp
ZChldWlkLCBldWlkKTsKICAgICAgICAgICAgc3lzdGVtKCIvdXNyL2Jpbi93aG9hbWkiKTsKICAg
ICAgICAgICAgc3lzdGVtKGNtZCk7CiAgICAgICAgfQogICAgICAgIGkrKzsKICAgIH0KfQoKCg==' | base64 -d > /usr/share/scripts/admin/complete/admin_ls.c
gcc /usr/share/scripts/admin/complete/admin_ls.c -o /usr/share/scripts/admin/complete/admin_ls
chown admin:admin /usr/share/scripts/admin/complete/admin_ls*
chmod 4551 /usr/share/scripts/admin/complete/admin_ls
echo 'LS_PATH="/usr/share/scripts/admin/complete"' >> /etc/environment
echo "#!/bin/bash" > /usr/share/scripts/admin/complete/myscript
echo "ls /home/admin/secret_docs/" >> /usr/share/scripts/admin/complete/myscript

# Cron task setup
echo "*/1 * * * * /scripts/checkflags.sh" | crontab -

echo "Challenge setup complete! login with:"
echo "  User: loginuser"
echo "  Pass: loginuser"