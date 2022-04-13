# Discord

Why Nativefy: 

* Discord already has its own electron app but only allows single-instance and is not portable. 
* The following builds are therefore meant to serve those who are paranoid of telementry and/or require having multiple users logged on in different instances.

## Discord-main

(was #2f3136 before)

```
nativefier 'https://discord.com/app' -p windows -n Discord --portable --background-color '#1F2225' --disable-dev-tools --icon './icons/discord.ico' --win32metadata '{"CompanyName":"Discord"}' --single-instance --tray
```
## Discord-multi

```
nativefier 'https://discord.com/app' -p windows -n Discord --portable --background-color '#1F2225' --disable-dev-tools --icon ./icons/discord.ico --win32metadata '{"CompanyName":"Discord"}'
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
nativefier 'https://old.reddit.com/?geo_filter=GLOBAL' -p windows -n Reddit -m --portable --maximize --icon './icons/reddit.ico' --win32metadata '{"CompanyName":"Reddit"}'
```

## Reddit-incognito
```
nativefier 'https://old.reddit.com/?geo_filter=GLOBAL' -p windows -n Reddit -m --portable --maximize --icon './icons/reddit.ico' --win32metadata '{"CompanyName":"Reddit"}' --clear-cache
```

# Typeracer

Why Nativefy:
* The entire website is a single-page app, also the cookies doesn't seem to be persistent unless you log in. Keeping it sandboxed is a no-brainer.

## Typeracer-main

```
nativefier 'https://play.typeracer.com/' -p windows -n Typeracer --portable --disable-dev-tools --disable-context-menu --icon './icons/typeracer.ico' --win32metadata '{"CompanyName":"Typeracer"}' --single-instance
```

## Replit

Why Nativefy:
* website is nicely designed to run in a single tab, rarely any multitab navigation. Making it a standalone app gives you an all-in-one IDE

```
nativefier 'https://replit.com' -p windows -n Replit --portable --maximize --disable-dev-tools --icon 'https://replit.com/public/icons/favicon-196.png' --win32metadata '{"CompanyName":"Replit"}'


# building with docker
docker run --rm -v $PWD/icons/:/src -v $PWD/build/:/target nativefier/nativefier --icon /src/replit.png --name Replit -p windows https://replit.com /target/
```
