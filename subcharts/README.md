# DEPENDENCIAS HELM CHARTS

Las dependencias en Helm charts son otros charts que un chart principal necesita para funcionar correctamente. Son como “subcomponentes” que se instalan junto con tu chart principal y que cumplen una función específica (por ejemplo, una base de datos como Redis, una cola de mensajes como RabbitMQ, etc.).


## Pasos para configurar las dependencias en un chart Helm

1. En el archivo `Chart.yaml` del chart principal, agrega una sección `dependencies` con la lista de dependencias que deseas instalar:

Ejemplo de archivo `Chart.yaml` del charts principal:
```yaml
dependencies:
  - name: redis
    version: 7.0.0
    repository: https://charts.bitnami.com/bitnami
  - name: rabbitmq
    version: 3.9.0
    repository: https://charts.bitnami.com/bitnami
```

2. Ejecutar comando de helm dependencys update para descargar las dependencias
```bash
helm dependency update
```

3. en caso de borrar el chart de dependencias con el comando helm dependency build, se debe eliminar el archivo `Chart.yaml` y `Chart.lock` y volver a ejecutar el comando de instalación de helm.
```bash
helm dependency build
```

4. podemos listar las dependencias instaladas con el comando helm dependency list
```bash
helm dependency list
```

