# Instalacion de aplicacion wordpress

1. comando de instalacion wordpress incialmente
```bash 
helm install local-wp bitnami/wordpress --version 25.0.3  -f custom-values.yaml
```
2. comando de actualizacion de wordpress incialmente
```bash 
helm upgrade local-wp bitnami/wordpress --version 25.0.3 --reuse-values   -f custom-values.yaml
```

3. comando para ver los values del despliegue hecho
```bash
helm get values local-wp
helm get values local-wp --revision 1
```

4. comando para realizar rollback simulacion de instalacion fallida y rollback
```bash
helm upgrade local-wp bitnami/wordpress --version 25.0.3 --reuse-values   -f custom-values.yaml  --set "image.tag=noexiste" 

helm rollback local-wp 2

# comando para actualziar pero si hay un fallo revirte con un historico limpio
helm upgrade \
  my-wordpress bitnami/wordpress \
  --reuse-values \
  --version 25.0.3 \
  --values custom-values.yaml  \  
  --set "image.tag=noexiste" \
  --atomic \
  --cleanup-on-fail \
  --debug \
  --timeout 2m
```



```