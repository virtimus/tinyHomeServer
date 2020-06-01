CRUD standard options:

default - output content in system format (ie thosts - /etc/hosts)
#-add [json] - add an entry (upsert only)


- s set id|[key:value] [key:value]|[json] - upsert an entry/ies
- g get id|[key:value] [fname]
- d del id|[key:value] - remove entry/entries (*=* for all
- l lst - list all (json)


ie

tfeatures s name:hass status:active