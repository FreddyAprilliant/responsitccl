# docker-pelican

* pelican (python-based static site generator) on alpine linux (160.1 MB)
* heavily inspired/stolen from vsense/pelican 

## Example docker-compose.yml


    mkdir ~/pelican-data
    git clone git@github.com:j-c-h-e-n-g/pelican-sp00nfeeder.git ~/pelican-data

    version: '2'
    services:
      pelican:
        image: jcheng/docker-pelican
        ports:
          - 8000:8000
        volumes:
          - ~/pelican-data:/opt/data

