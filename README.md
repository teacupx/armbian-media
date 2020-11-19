# armbian-media
Packages for Armbian multimedia support. Right now, it includes:
1. The meta-packages to do the system configs in Rockchip platforms and Odroid XU4, with the Legacy kernel
2. Mali binary libraries
2. OpenGL to GLES wrapper (gl4es)

-----------------------------
### Usage
For the meta-packages and mali libraries, clone the repo and run the script:

  `$ git clone https://github.com/teacupx/armbian-media`
  
  `$ cd armbian-media`
  
  `$ bash ./crea-packages.sh`

For gl4es, you must cd into the corresponding directory for your architecture (gl4es/armhf or gles/arm64), and run:

  `./compile.sh`
  
Packages will be created in the `output/` directory.
