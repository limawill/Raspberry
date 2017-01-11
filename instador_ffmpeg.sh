#!/bin/bash

function adiciona_repositorios {
  echo "     "
  echo "Instalando repositorio multimedia (update)....."
  echo "  "
  sudo echo "deb http://www.deb-multimedia.org jessie main non-free" >>  /etc/apt/sources.list
  sudo echo "deb-src http://www.deb-multimedia.org jessie main non-free" >>  /etc/apt/sources.list
  echo "     "
  echo "Instalando chave dos repositorios (update)....."
  echo "  "
  sudo apt-get install deb-multimedia-keyring -y
}

function atualiza_sistema {
  echo "     "
  echo "Atualizando (update)....."
  echo "  "
  sudo apt-get update
 
  echo "     "
  echo "Atualizando (upgrade) ......."
  echo "  "
  sudo apt-get upgrade -y
  
  echo "     "
  echo "Atualizando (rpi)....."
  echo "  "
  sudo rpi-update -y
  
  echo "     "
  echo "Fim das atualizacoes passando para dependencias"
  echo "  "
}

function install_build_tools {

  echo "     "
  echo "Instalando dependencias sistema"
  echo "  "
  sudo apt-get update
  sudo apt-get remove ffmpeg -y
  sudo apt-get install build-essential libmp3lame-dev libvorbis-dev libtheora-dev libspeex-dev yasm pkg-config libfaac-dev libopenjpeg-dev libx264-dev -y
}


function baixando_ffmpeg {
	
  echo "Baixando ffmpeg....."
  mkdir software
  cd software
  wget http://ffmpeg.org/releases/ffmpeg-2.7.2.tar.bz2
  cd ..
  mkdir src
  cd src
  tar xvjf ../software/ffmpeg-2.7.2.tar.bz2
}

function compilacao_utilizacao {
	
  echo "Compilando ffmpeg....."
  cd ffmpeg- 2.7.2
  ./configure --enable-gpl --enable-postproc --enable-swscale --enable-avfilter --enable-libmp3lame --enable-libvorbis --enable-libtheora --enable-libx264 --enable-libspeex - permitam-compartilhada --enable-pthreads --enable-libopenjpeg --enable-libfaac --enable-nonfree 
  make 
  sudo make install

  echo "Executando ....."
  sudo /sbin/ldconfig
  
}

adiciona_repositorios
atualiza_sistema
install_build_tools
baixando_ffmpeg
compilacao_utilizacao
