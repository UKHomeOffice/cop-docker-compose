# COP Platform build



# Default variables


| Variable name | description | example |
|:---|:---:|---:|
| NAME | application name | app1 |
| KUBE_NAMESPACE | kubernetes namespace | develop |
| KUBE_SERVER | kubernetes api server url ||
| KUBE_TOKEN | kubernetes service token | XXXX |
| INTERNAL_CA_URL | internal CA url | ca.develop.svc.cluster.local |
| NO_LOGGING_URL_PARAMS | nginx proxy log url parameters | false |
| NO_LOGGING_BODY | nginx proxy log payload body | false |
| NO_LOGGING_RESPONSE | nginx proxy log response | false |
| KEYCLOAK_URL | keyclock url | https://keycloak.develop.svc.cluster.local/auth |
| KEYCLOAK_REALM | keycloak realm | develop |
| KEYCLOAK_SECRET | keycloak client secret | XXXX |
| KEYCLOAK_ROLE | restrict access to specified role | roleA |
| KEYCLOAK_CONTACT | contact email address for issues | xyz@example.com |
| INT_DOMAIN | internal domain | namespace.scv.cluster.local |
| EXT_DOMAIN | external domain | example.com |
| PROTOCOL | http/https protocol | https:// |
| IMAGE_TAG | deployment image tag | build_1 |
| WHITELIST | comma separated list of IP's to be allowed through ingress | x.x.x.x |
| UI_ENVIRONMENT| Tag for UI to show environment | DEVELOPMENT |
| UI_VERSION | Tag for UI to show stage | ALPHA |
| AUTH_CLIENT_ID | defaults to NAME ||
| PRIVATE_UI_NAME| name of private ui pod | private-ui |
| PRIVATE_FORM_NAME | name of formio pod | private-formio |
| PRIVATE_WORKFLOW_ENGINE_NAME | name of workflow engine pod | private-workflow-engine |