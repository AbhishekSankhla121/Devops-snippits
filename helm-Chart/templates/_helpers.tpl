# ***
# Named Templates:
# 1. A named templated (partial or a subtemplate) is simply  a template defined inside of a file and given a name 
#  - three actions for declaring annd manaing templates: 
# (i)  define: declare a new named template inside of your template 
# (ii) template: import a named template
# (iii) block : declare  aspecial kind of fillable template area 
# ***

# ***
# Declaring and using templates with define and  template
# Note :: a define does not produce output unless it is called with a tem
# these templates are globally available 
# ***


{{- define "mychart.labels" }}
  labels:
    generator: helm
    date: {{ now | htmlDate }}
    chart: {{ .Chart.Name }}
    version: {{ .Chart.Version }}
{{- end  }}

