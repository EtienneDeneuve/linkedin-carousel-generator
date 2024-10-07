# How to use it

## TL&DR

- Install docker
- update the prez.md file
- build the docker image (can take time):
  ```bash
  docker build -t pandoc-custom-ubuntu -f ./Dockerfile . --progress=plain
  ```
- run it using :
  ```bash
  docker run --rm -it \
    -v "$(pwd):/data" \
    pandoc-custom-ubuntu \
    "files/prez.md" -o "output/prez-ubu.pdf" \
    --pdf-engine=xelatex \
    --pdf-engine-opt=-shell-escape \
    --pdf-engine-opt=-interaction=nonstopmode \
    --template="templates/v2.tex"
  ```

For more information, look at [My Blog](https://etienne.deneuve.xyz/2024/10/05/automate-linkedin-carrousel/)