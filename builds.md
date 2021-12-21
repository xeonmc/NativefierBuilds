# Discord

Why Nativefy: 

* Discord already has its own electron app but only allows single-instance and is not portable. 
* The following builds are therefore meant to serve those who are paranoid of telementry and/or require having multiple users logged on in different instances.

## Discord-main

```
nativefier "https://discordapp.com/app" -p windows -n Discord --portable --background-color '#1f2225' --disable-dev-tools --disable-context-menu --icon ./icons/discord.ico --win32metadata '{"CompanyName":"Discord"}' --single-instance --tray
```

## Discord-multi

```
nativefier 'https://discordapp.com/app' -p windows -n Discord --portable --background-color '#1f2225' --disable-dev-tools --disable-context-menu --icon ./icons/discord.ico --win32metadata '{"CompanyName":"Discord"}'
```

# Desmos 

Why Nativefy:
* Desmos' is a single-page webapp so you might have many instances of it open in different tabs to calculate different things. 
* Much nicer workflow to simply middle-click on a taskbar icon if you want to load a new calculator. Also less likely to get lost in multiple tabs.

## Desmos-main

```
nativefier "https://desmos.com/calculator" -p windows -n Desmos --portable --disable-context-menu --icon ./icons/desmos.ico --win32metadata '{"CompanyName":"Desmos"}' 
```
