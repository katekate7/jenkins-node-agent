FROM jenkins/inbound-agent

# Passer à l'utilisateur root pour installer des packages
USER root

# Mettre à jour les paquets et installer Node.js
RUN apt update && apt install -y curl

# Installer Node.js (version 14 dans cet exemple)
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt install -y nodejs npm

# Vérifier l'installation de Node.js et npm
RUN node -v && npm -v

# Installer les dépendances globales (optionnel)
RUN npm install -g yarn

# Revenir à l'utilisateur Jenkins (optionnel, pour des raisons de sécurité)
USER jenkins