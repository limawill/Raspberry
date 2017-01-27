#!/bin/bash

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
  echo "Instalando videolan no sistema"
  echo "  "
 
  cd /usr/src
  git clone git://git.videolan.org/x264
  cd x264
  echo "     "
  echo "Configurando pacotes sistema"
  echo "  "
  ./configure --host=arm-unknown-linux-gnueabi --enable-static --disable-opencl
  make
  echo "     "
  echo "Instalando ........"
  echo "  "
  sudo make install

  echo "     "
  echo "Fim da instacacao Videolan"
  echo "  "
  }


function baixando_ffmpeg {
	
  echo "Baixando ffmpeg....."
  cd /usr/src
  git clone https://github.com/FFmpeg/FFmpeg.git
  cd ffmpeg
  echo "     "
  echo "Configurando pacotes sistema"
  echo "  "
  sudo ./configure --arch=armel --target-os=linux --enable-gpl --enable-libx264 --enable-nonfree
  echo "     "
  echo "Instalando ........"
  echo "  "
  make
  sudo make install
}



atualiza_sistema
install_build_tools
baixando_ffmpeg

