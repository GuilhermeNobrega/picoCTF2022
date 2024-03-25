Operation Oni
Download this disk image, find the key and log into the remote machine.
Note: if you are using the webshell, download and extract the disk image into /tmp not your home directory.
Download disk image
Remote machine: ssh -i key_file -p 60255 ctf-player@saturn.picoctf.net

mktemp -d

wget https://artifacts.picoctf.net/c/71/disk.img.gz
gzip -d disk.img.gz

mmls -B disk.img.gz (Listar partições de um sistma de volume) -B bytes

DOS Partition Table
Offset Sector: 0
Units are in 512-byte sectors

      Slot      Start        End          Length       Description
000:  Meta      0000000000   0000000000   0000000001   Primary Table (#0)
001:  -------   0000000000   0000002047   0000002048   Unallocated
002:  000:000   0000002048   0000206847   0000204800   Linux (0x83)
003:  000:001   0000206848   0000471039   0000264192   Linux (0x83)

fls disk.img -o 206848 ( listar arquivos e diretórios na imagem disco; defina offset;pegue maior valor,valor da partição pois  significa :limite superior ou o último setor ocupado pela partição.) -o O deslocamento no arquivo de imagem, também conhecido como offset, é a posição específica dentro do arquivo onde um processo ou operação deve começar ou se concentrar. Em termos mais simples, é o ponto de partida dentro do arquivo.

d/d 458:        home
d/d 11: lost+found
d/d 12: boot
d/d 13: etc
d/d 79: proc
d/d 80: dev
d/d 81: tmp
d/d 82: lib
d/d 85: var
d/d 94: usr
d/d 104:        bin
d/d 118:        sbin
d/d 464:        media
d/d 468:        mnt
d/d 469:        opt
d/d 470:        root
d/d 471:        run
d/d 473:        srv
d/d 474:        sys
V/V 33049:      $OrphanFiles


fls disk.img -o 206848 470  (Só acrescentei o offset de root)

r/r 2344:       .ash_history
d/d 3916:       .ssh


fls disk.img -o 206848 3916

r/r 2345:       id_ed25519
r/r 2346:       id_ed25519.pub



icat disk.img -o 206848 2345

(Anote a chave em ponha em um arquivo)

ssh -i sshkey.private -p <PORT> ctf-player@saturn.picoctf.net

chmod 400 sshkey.private (ou 700)

cat flag.txt 
picoCTF{k3y_5l3u7h_af277f77}
