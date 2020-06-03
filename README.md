# tinyHomeServer

A tiny home automation and media center server project.

This platform is in experimental/alpha stage.

## Getting started

Use instructions from [bootstrap.md](bootstrap.md)


## Tiny Home Server components


### thsFeature 

A functional feaure/package of ths:

[F1 - UserLAnd](bootstrap/androidtv-userland.md)

UserLAnd is an open-source Android app which allows us to run Ubuntu as a base platform for other software.

User can: 

- ssh access to tinyHomeServer
- install Ubuntu packages
- use commandline tools
- use adb to control Android part
	
[F2 - Shell](bootstrap/shell.md)

Shell layer- helper scripts an resources

[F3 - Home Assistant](features/hass.md)

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






