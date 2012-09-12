#!/bin/bash
set -x

for id in `awk 'FS=":" {if(($3 ==0 && $1 !="root")) print $1}' /etc/passwd`
do
	mailx -s "Alerta, alguien mas es root" admin@mail.org < EOT
	 Mensaje de alerta, verifica por que alguien mas es root.
	EOT
done
