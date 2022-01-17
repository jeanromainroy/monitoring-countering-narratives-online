# MAKE SURE THAT src/constants.json is configured as
# "SUBDIRECTORY": "/projects/seshat/"

# build
npm run build

# copy
# cp -r ./public/* ~/Projects/portfolio/public/projects/seshat/

# scp data
# scp -r ./public/assets/data/brazil/* portfolio:/home/ubuntu/portfolio/public/projects/seshat/assets/data/brazil/
# scp -r ./public/assets/data/ivory_coast/* portfolio:/home/ubuntu/portfolio/public/projects/seshat/assets/data/ivory_coast/
# scp -r ./public/assets/data/lebanon/* portfolio:/home/ubuntu/portfolio/public/projects/seshat/assets/data/lebanon/

# scp fonts
# scp -r ./public/assets/fonts/* portfolio:/home/ubuntu/portfolio/public/projects/seshat/assets/fonts/

# scp images
# scp -r ./public/assets/images/* portfolio:/home/ubuntu/portfolio/public/projects/seshat/assets/images/

# scp portraits
# scp -r ./public/assets/portraits/* portfolio:/home/ubuntu/portfolio/public/projects/seshat/assets/portraits/

# scp scripts
# scp -r ./public/assets/scripts/* portfolio:/home/ubuntu/portfolio/public/projects/seshat/assets/scripts/

# scp bundles
scp ./public/bundle.* portfolio:/home/ubuntu/portfolio/public/projects/seshat/
# scp ./public/index.html portfolio:/home/ubuntu/portfolio/public/projects/seshat/