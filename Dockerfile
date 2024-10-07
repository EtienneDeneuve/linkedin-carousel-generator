FROM pandoc/latex:latest-ubuntu

# Installer les packages
RUN apt-get update && \
    apt-get install -y \
        python3-pygments \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        texlive-science \
        fonts-freefont-ttf && \
    rm -rf /var/lib/apt/lists/*

# Générer les formats nécessaires pour les moteurs TeX installés
RUN fmtutil-sys --byfmt pdflatex 
RUN fmtutil-sys --byfmt xelatex

# Mettre à jour tlmgr sans exécuter les actions associées
RUN tlmgr update --self --all --no-execute-actions 

# Installer les dépendances pour que le template puisse fonctionner
RUN tlmgr install \
        adjustbox \
        enumitem \
        fvextra \
        lineno \
        mdframed \
        minted \
        ragged2e \
        titlesec \
        wrapfig \
        fvextra

# Copier les polices personnalisées (optionnel)
# Si vous avez des polices spécifiques, vous pouvez les copier dans l'image
ADD data/fonts/* /usr/share/fonts/truetype/custom/

# Mettre à jour le cache des polices
RUN fc-cache -f -v

