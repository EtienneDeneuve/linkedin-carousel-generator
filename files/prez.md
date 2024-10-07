---
author: Etienne Deneuve
company: www.simplified.fr
---

# J'aime pas Canvas

Oui, c'est un chouette outil, mais, moi je n'aime pas...

\newpage

# Comment faire sans ?

- Ecrire un markdown
- Lancer un script
- Publier le PDF

\newpage

# Docker, Pandoc, LaTex 

```bash
docker run --rm -it \
  -v "$(pwd):/data" \
  pandoc-custom \
  "files/prez.md" -o "output/prez.pdf" \
  --pdf-engine=xelatex \
  --pdf-engine-opt=-interaction=nonstopmode \
  --template="templates/v2.tex"
```

<!--  -->