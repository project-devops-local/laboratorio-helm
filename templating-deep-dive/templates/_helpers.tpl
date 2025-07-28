{{ define "templating-deep-dive.fullname" -}}
{{- $defaultName := printf "%s-%s" .Release.Name .Chart.Name -}}
{{- .Values.customName  | default $defaultName |trunc 63|trimSuffix "-" -}} 
{{- end -}}

{{ define "templating-deep-dive.selectorLabels" -}}
app: {{ .Chart.Name }}
release: {{ .Release.Name }}
{{- end -}}




{{ define "templating-deep-dive.validators.portRange" -}}
{{- $sanitizedPort := int . -}}
{{- if or (lt $sanitizedPort 1) (gt $sanitizedPort 65535) -}}
{{- fail "Error de port supera el rango de 1 y 65535 " -}}
{{- end -}}
{{- end -}}



{{ define "templating-deep-dive.validators.service" -}}
{{ include "templating-deep-dive.validators.portRange" .port -}}

{{- $allowedSvcTypes := list "ClusterIP" "NodePort" -}}
{{- if not (has  .type $allowedSvcTypes) -}}
{{- fail (printf "Error de tipo de servicio no valido %s soporte values are %s" .type (join ", " $allowedSvcTypes)) -}}
{{- end -}}
{{- end -}}