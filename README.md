# Comandos helm charts

## Introduccion

Helm es un gestor de paquetes para Kubernetes que facilita la instalación, actualización y administración de aplicaciones mediante el uso de plantillas llamadas Charts. Permite automatizar la gestión del ciclo de vida de las aplicaciones, simplificando su despliegue y configuración en entornos Kubernetes

## estructura de un chart

Estructura de un chart:
```bash
├── Chart.yaml
├── charts
├── templates
│   ├── NOTES.txt
│   ├── _helpers.tpl
│   ├── deployment.yaml
│   ├── ingress.yaml
│   ├── service.yaml
│   └── tests
│       └── test-connection.yaml
└── values.yaml
```

1. Para buscar el Chart de WordPress dentro del repositorio Bitnami que tienes agregado, usa:
```bash
helm search repo bitnami/wordpress
````

2. Si quieres ver todos los valores configurables por defecto del Chart (muy útil para personalizar la instalación), ejecuta:

```bash
helm show values bitnami/wordpress
```

3. Para consultar la documentación oficial (README) del Chart, donde se explican los usos y parámetros principales, utiliza:

```bash
helm show readme bitnami/wordpress
```

4. Si necesitas ver información general del Chart, como su versión, descripción y quién lo mantiene, usa:

```bash
helm show chart bitnami/wordpress
```

5. Cuando quieras actualizar la lista de Charts disponibles en todos los repositorios agregados, ejecuta:

```bash
helm repo update
```

6. Si necesitas eliminar el repositorio Bitnami de la configuración de Helm, utiliza:

```bash
helm repo remove bitnami
```

7. Para ver todos los repositorios de Helm que tienes actualmente configurados, ejecuta:

```bash
helm repo list
```

8. Finalmente, para agregar el repositorio oficial de Bitnami (si aún no lo tienes), usa:

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```

9. Para ver los valores de configuración personalizados que se usaron al instalar el release `local-wp`:
```bash
helm get values local-wp
```


10. Para ver **todos los valores** de configuración, tanto los por defecto como los personalizados, del release `local-wp`:
```bash
helm get values local-wp --all
```

11. Para ver las notas post-instalación (tips de acceso, URLs, etc.) del release `local-wp`:
```bash
helm get notes local-wp
```


12. Para instalar el release `local-wp` con la versión 25.0.3 de Bitnami, usa:

```bash
helm install local-wp bitnami/wordpress --version 25.0.3
```
13. Para actulizar el release `local-wp` con la versión 25.0.3 de Bitnami y usar los valores personalizados en `values.yaml`, usa:
```bash
helm upgrade local-wp bitnami/wordpress --version 25.0.3  --reuse-values --values  values.yaml
```



14. Para eliminar el release `local-wp` y sus datos, usa:
```bash
helm uninstall local-wp
```

