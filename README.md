# Curso helm
En este curso se trabajara con repositorios helm de kubernetes y sus demos para mayor entendimiento

## Instalacion

[link instalacion](https://helm.sh/docs/intro/install/)

## Comandos basicos

helm add repo [url] --> añadir repo helm
helm repo list      --> Listar los repos agregados
helm search repo [nameRepo] --> buscar todos los paquetes que esten asociados al repositorio.
helm search hub [app]  -> buscar paquetes en la nube 
helm search repo [app]  -> buscar paquetes en los repos agregados
helm search repo [app] -o yaml -> buscar paquetes en los repos y ver en formato yaml
helm search repo [app] -o json -> buscar paquetes en los repos y ver en formato json
helm search repo [app] -l  -> lista paquetes en los repos y si historial
helm search repo [app] --version [VersionEspecifica]  -> lista los paquetes que cumplan con la version.
helm  repo remove [app]   -> eliminar repositorio

## instalar aplicaciones 

Ejemplo de despliegue 

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-redis bitnami/redis --version 18.0.0

## comando get release desplegadas con helm 

helm list -> lista los deployment helm chart
helm status apache1 -> se obtiene el detalle del deployment en formato txt para ver el estado
helm get manifest [app] -> se revisa el manifiesto kubernetes desplegado en el cluster
helm get notes [app] -> recupera la documentacion del char
helm get values [app] -> recupera los valores definidos en el release desplegado
helm get all [app]  -> obtiene todos los valores del release apartir del chart  manifest , notes etc

## comando show anivel del chart

helm show readme bitnami/apache > readme.md
helm show chart bitnami/apache > defchar
helm show values bitnami/apache > values-apache
helm show all bitnami/apache > 

## upgrade charts

helm upgrade --set service.ports.http=8080 --set service.type=NodePort  apache1 bitnami/apache -> ejemplo de upgrade port y tipo de servicio NodePort
helm upgrade -f values-apache.yaml apache1 bitnami/apache -> ejemplo cambio de valores con fichero

## rollback despliegues de 

helm history apache1 -> validar el historico de deployment
helm rollback apache1 [version] -> devolverse a un despliegue anterior

## borrar despliegue release
helm uninstall --dry-run apache1 -> simula la desistalacion pero no hace nada solo comprueba que no haya errores al eliminar.

helm uninstall --keep-history apache1 -> con este comando flag --keep-history elimina pero deja el rastro de helm history [app]

## Comentarios de tipo helm 

ejemplo 

```yaml
{{- /*
  Helm comment . este comentario se agrega al manifest de kubernetes que no quiere ser agregado al template
*/}}
```

## Condiciones helm