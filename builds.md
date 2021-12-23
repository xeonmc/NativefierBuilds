# Discord

Why Nativefy: 

* Discord already has its own electron app but only allows single-instance and is not portable. 
* The following builds are therefore meant to serve those who are paranoid of telementry and/or require having multiple users logged on in different instances.

## Discord-main

```
nativefier 'https://discordapp.com/app' -p windows -n Discord --portable --background-color '#2f3136' --disable-dev-tools --disable-context-menu --icon './icons/discord.ico' --win32metadata '{"CompanyName":"Discord"}' --single-instance --tray
```

## Discord-multi

```
nativefier 'https://discordapp.com/app' -p windows -n Discord --portable --background-color '#2f3136' --disable-dev-tools --disable-context-menu --icon ./icons/discord.ico --win32metadata '{"CompanyName":"Discord"}'
```

# Desmos 

Why Nativefy:
* Desmos' is a single-page webapp so you might have many instances of it open in different tabs to calculate different things. 
* Much nicer workflow to simply middle-click on a taskbar icon if you want to load a new calculator. Also less likely to get lost in multiple tabs.

## Desmos-main

```
nativefier 'https://desmos.com/calculator' -p windows -n Desmos --portable --disable-context-menu --icon './icons/desmos.ico' --win32metadata '{"CompanyName":"Desmos"}' 
```

# GitHub

Why Nativefy:
* Purely for portable functionality if I want to access releases/secrets of a private repo without having to bother with logins. I don't really think there's much reason to use have it as an app.

## GitHub-main
```
nativefier 'https://github.com' -p windows -n GitHub --portable --icon './icons/github.ico' --win32metadata '{"CompanyName":"GitHub"}'
```

# Reddit (old layout)

Why Nativefy:
* The Reddit Progressive Web App uses the new layout, also it auto-detects region unless you're logged in.

## Reddit-main
```
nativefier 'https://old.reddit.com/?geo_filter=GLOBAL' -p windows -n Reddit --portable --icon './icons/reddit.ico' --win32metadata '{"CompanyName":"Reddit"}'
```

## Reddit-incognito
```
nativefier 'https://old.reddit.com/?geo_filter=GLOBAL' -p windows -n Reddit --portable --icon './icons/reddit.ico' --win32metadata '{"CompanyName":"Reddit"}' --clear-cache
```