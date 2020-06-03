# tinyHomeServer

A tiny home automation and media center server project.

This platform is in experimental/alpha stage.

## Getting started

Use instructions from [bootstrap.md](bootstrap.md)


## Tiny Home Server components


### thsFeature 

A functional feaure/package of ths:

[F1 - UserLAnd](bootstrap/androidtv-userland.md) - Ubuntu on Android
	
[F2 - Shell](bootstrap/shell.md) - Shell layer helper scripts an resources

[F3 - Home Assistant](features/hass.md) - Home automation platform

[F4 - Jupyter Notebook](features/jupyter.md) - Organize and automate Your work

### thsDevMachine

Development machine on which You can build/control any other system component. 
Not necessary for end-user.

### thsMasterNode

Your home server main machine with central software - Android && Ubuntu/UserLAnd

Android TV box with ethernet socket, wifi & at least 2GB recommended

### thsDevice

Any device controlled by master node.

#### thsDeviceType 

String with device category/platform/role

ie: iot/esphome/cam, agent/android/inspector






