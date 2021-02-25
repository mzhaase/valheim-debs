# valheim-debs
Debian packages for valheim.

There are two packages, valheim-server and valheim-server-plus. valheim-server installs the valheim dedicated server. valheim-server-plus installs ValheimPlus mod: https://www.nexusmods.com/valheim/mods/4 this has the prerequisite of also installing valheim-server. You can download the debs manually from release or use the repository.

Both packages register a systemd service and can be configured via files in /etc/default

## valheim-server
This installs valheim dedicated server and creates a service for it. Please note that this uses steamcmd to download, it does not contain the actual server binaries.

**This will always install the latest version, there is no way within steamcmd to not do that**

This also means version pinning and updating does not work. You can update the server version by reinstalling the package.

The server can be configured by changing /etc/default/valheim-server. You HAVE to change that file to set the password. The server will not start otherwise.

The server will be installed to /usr/local/valheim-server the world is in /home/valheim/.config/unity3d/IronGate/Valheim/worlds/

For backing up your world files you can add this script to cron: /usr/local/valheim-server/backup.sh
### Usage
    dpkg --add-architecture i386
    wget https://apt.facinating.tech/key.gpg
    apt-key add key.gpg
    echo "deb https://apt.facinating.tech debian main" > /etc/apt/sources.list.d/facinating.tech.list
    apt-get update
    apt-get install valheim-server
    echo "PASSWORD=mypass1244" >> /etc/default/valheim-server
    systemctl start valheim-server

## valheim-server-plus
This installs valheim plus mod. Uninstalling this package will cleanly delete all mod files and restore the valheim server directory back to its prior state. It does not touch the world files. This file **does** support upgrading, version pinning, etc. Version the same as Valheim Plus mod. We do NOT offer support for this mod.

Not that this also installs valheim-server, but starting valheim-server service starts the server without valheim plus mod.

### Usage
    dpkg --add-architecture i386
    wget https://apt.facinating.tech/key.gpg
    apt-key add key.gpg
    echo "deb https://apt.facinating.tech debian main" > /etc/apt/sources.list.d/facinating.tech.list
    apt-get update
    apt-get install valheim-server-plus
    echo "PASSWORD=mypass1244" >> /etc/default/valheim-server-plus
    
    # if you previously ran valheim-server without the mod
    systemctl stop valheim-server
    systemctl disable valheim-server
    systemctl start valheim-server-plus

## checking logs
    journalctl -u valheim-server -f
    # or
    journalctl -u valheim-server-plus -f