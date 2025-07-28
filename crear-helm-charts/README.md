 # Crear primer charts helm 
 
se crea un helm chart basico que no aprovecha las virtudes del helm pero se incia con ua estructura de directorios y archivos

nginx
│   ├── .helmignore
│   ├── templates
│   │   ├── service.yaml
│   │   └── deployment.yaml
│   ├── values.yaml
│   └── Chart.yaml

## comandos para comprobar template

- Con este comando podemos ver que se genera un archivo de template que es el que se usa para crear el deployment y el service y que todo esa correcto.

```bash
helm template nginx  
```

- Este comando nos permite comprobar que el archivo de template es correcto y que no hay errores.
```bash
 helm lint nginx
```

- Este comando nos permite crear el package del chart.
```bash
helm package nginx
```

- este comando genera el index de los charts que se encuentran en el directorio actual.
```bash
helm repo index .
```

para publicar repositorio de charts

Se crea un reposirio en github y se configura una github page donde van a estar los charts publicados.

----------------------------------------------

# Crear un chart con helm 3

Este comando crea un chart con el nombre de backend-app con su estructura de directorios y archivos
```bash
helm create backend-app
```