{{/*
Expand the name of the chart.
*/}}
{{- define "demo-crm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "demo-crm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "demo-crm.labels" -}}
helm.sh/chart: {{ include "demo-crm.chart" . }}
{{ include "demo-crm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "demo-crm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "demo-crm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
