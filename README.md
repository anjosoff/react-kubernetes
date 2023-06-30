# React app no Kubernetes (Minikube)


### Stacks utilizadas

|badge|stack|descrição|versão|
|--|--|--|--|
|![Vite](https://img.shields.io/badge/vite-%23646CFF.svg?style=for-the-badge&logo=vite&logoColor=white)|Vite.js|Generation Frontend Tooling|4.3.9|
|![React](https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB)|React.js|The library for web and native user interfaces|18.2.0|
|![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)|Docker| A set of platform as a service products that use OS-level virtualization to deliver software in packages called containers.|Client Version:24.0.2 - Server Version: 24.0.2|
|![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)| Kubernetes|system for automating deployment, scaling, and management of containerized applications.| Client Version: v1.27.2 -Kustomize Version: v5.0.1 -Server Version: v1.26.3|
|<img src="https://github.com/kubernetes/minikube/raw/master/images/logo/logo.png" width="100" alt="minikube logo">|Minikube|minikube is local Kubernetes, focusing on making it easy to learn and develop for Kubernetes.|v1.30.1|

### Passo a passo 

IMPORTANTE :Certifique-se que você tenha todas as stacks instaladas

1. Inicie o minikube
    ```minikube start```
    &nbsp;
2. Deixe setado que irá usar o registro local para fazer o pull da imagem
    ```eval $(minikube docker-env)```
    &nbsp;
    > Referência: "Local Docker images no Minikube" por [Waldemar Neto em IMasters](https://imasters.com.br/cloud/local-docker-images-no-minikube)
3. Navegue até a pasta react-app/ onde se encontra o Dockerfile e execute:
    ```npm run build```
    > Vai gerar uma pasta chamada "dist" contento outra pasta "assets" e o index.html 
4. Agora é possivel fazer o build da imagem
    ```docker build . --tag=react-app:latest --rm=true```
    &nbsp;
    > O argumento ```--rm=true``` faz com que apenas seja feito o build da imagem e o container seja removido (Veja a [documentação do Docker](https://docs.docker.com/engine/reference/commandline/rm/))
5. Execute ```docker images```
    > Veja que agora sua imagem recém buildada está no registro local do kubernetes
 
6. Novamente, navegue até a raiz da aplicação onde se encontra ```react.yaml``` e execute o apply. Esse é o arquivo de configuração do Kubernetes(similar ao Docker-compose.yaml para o Docker)
    ```kubectl apply -f react.yaml```
    &nbsp;
    output: ```deployment.apps/react-app created
            service/react-app-service created```
    &nbsp;
    > Com esse output o kubernetes diz que o deployment e o service foram criados
7. Usando o Minikube, é possível ver o estado do deployment (Available/Progressing) e o estado do Pod (Running). 


    Clique e veja o [GIF no imgur](https://i.imgur.com/5t8tWbf.gif)
    
    &nbsp;
    > No gif eu mostro os logs do pod, lá mostra que o VITE esta rodando dentro do pod de forma local e na network  (o mesmo ip do pod)
    > Utilize ```kubectl get pod -o wide``` para verificar todos os pods e seus respetivos IP's.
8. Por fim execute ``minikube service react-app-service```, sabendo que react-app-service é o nome do serviço que foi criado no YAML
    > Com isso o minikube vai abrir uma pagina no seu navegaddor padrão com o servidor do nginx

