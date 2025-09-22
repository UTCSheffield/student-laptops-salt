kde-plasma-desktop:
  pkg.installed

/etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc:
  file.managed:
    - makedirs: True
    - contents: |
        [ActionPlugins][0]
        RightButton;NoModifier=org.kde.contextmenu

        [ActionPlugins][1]
        RightButton;NoModifier=org.kde.contextmenu

        [Containments][1]
        ItemGeometries-1920x1080=
        ItemGeometriesHorizontal=
        activityId=ebc04315-c7bc-4b72-ab92-139f65ae8f18
        formfactor=0
        immutability=1
        lastScreen=0
        location=0
        plugin=org.kde.plasma.folder
        wallpaperplugin=org.kde.image

        [Containments][1][General]
        positions={"1920x1080":[]}

        [Containments][2]
        activityId=
        formfactor=2
        immutability=1
        lastScreen=0
        location=4
        plugin=org.kde.panel
        wallpaperplugin=org.kde.image

        [Containments][2][Applets][15]
        immutability=1
        plugin=org.kde.plasma.digitalclock

        [Containments][2][Applets][15][Configuration]
        popupHeight=375
        popupWidth=525

        [Containments][2][Applets][15][Configuration][Appearance]
        fontWeight=400

        [Containments][2][Applets][16]
        immutability=1
        plugin=org.kde.plasma.showdesktop

        [Containments][2][Applets][3]
        immutability=1
        plugin=org.kde.plasma.kickoff

        [Containments][2][Applets][3][Configuration]
        PreloadWeight=100
        popupHeight=492
        popupWidth=641

        [Containments][2][Applets][3][Configuration][General]
        favoritesPortedToKAstats=true

        [Containments][2][Applets][4]
        immutability=1
        plugin=org.kde.plasma.pager

        [Containments][2][Applets][5]
        immutability=1
        plugin=org.kde.plasma.icontasks

        [Containments][2][Applets][5][Configuration][General]
        launchers=

        [Containments][2][Applets][6]
        immutability=1
        plugin=org.kde.plasma.marginsseparator

        [Containments][2][Applets][7]
        immutability=1
        plugin=org.kde.plasma.systemtray

        [Containments][2][Applets][7][Configuration]
        SystrayContainmentId=8

        [Containments][2][General]
        AppletOrder=3;4;5;6;7;15;16

        [Containments][8]
        activityId=
        formfactor=2
        immutability=1
        lastScreen=0
        location=4
        plugin=org.kde.plasma.private.systemtray
        popupHeight=432
        popupWidth=432
        wallpaperplugin=org.kde.image

        [Containments][8][Applets][10]
        immutability=1
        plugin=org.kde.plasma.notifications

        [Containments][8][Applets][11]
        immutability=1
        plugin=org.kde.plasma.clipboard

        [Containments][8][Applets][12]
        immutability=1
        plugin=org.kde.plasma.devicenotifier

        [Containments][8][Applets][13]
        immutability=1
        plugin=org.kde.plasma.cameraindicator

        [Containments][8][Applets][14]
        immutability=1
        plugin=org.kde.plasma.keyboardlayout

        [Containments][8][Applets][9]
        immutability=1
        plugin=org.kde.plasma.manage-inputmethod

        [Containments][8][General]
        extraItems=org.kde.plasma.manage-inputmethod,org.kde.plasma.notifications,org.kde.plasma.mediacontroller,org.kde.plasma.clipboard,org.kde.plasma.devicenotifier,org.kde.plasma.cameraindicator,org.kde.plasma.keyboardlayout
        knownItems=org.kde.plasma.manage-inputmethod,org.kde.plasma.notifications,org.kde.plasma.mediacontroller,org.kde.plasma.clipboard,org.kde.plasma.devicenotifier,org.kde.plasma.cameraindicator,org.kde.plasma.keyboardlayout

        [ScreenMapping]
        itemsOnDisabledScreens=
        screenMapping=desktop:/o365-word.desktop,0,ebc04315-c7bc-4b72-ab92-139f65ae8f18,desktop:/o365-teams.desktop,0,ebc04315-c7bc-4b72-ab92-139f65ae8f18,desktop:/o365-outlook.desktop,0,ebc04315-c7bc-4b72-ab92-139f65ae8f18,desktop:/o365-onenote.desktop,0,ebc04315-c7bc-4b72-ab92-139f65ae8f18,desktop:/o365-onedrive.desktop,0,ebc04315-c7bc-4b72-ab92-139f65ae8f18,desktop:/o365-excel.desktop,0,ebc04315-c7bc-4b72-ab92-139f65ae8f18,desktop:/o365-powerpoint.desktop,0,ebc04315-c7bc-4b72-ab92-139f65ae8f18

/etc/skel/.config/kdeglobals:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: True
    - contents: |
        [General]
        ColorScheme=Breeze
        Name=Breeze
        XftDPI=144

        [KDE]
        LookAndFeelPackage=org.kde.breeze.desktop

        [KScreen]
        ScaleFactor=1.5

        [WM]
        activeBackground=#3daee9
        activeBlend=#eff0f1
        activeForeground=#fcfcfc
        inactiveBackground=#d3dae3
        inactiveBlend=#eff0f1
        inactiveForeground=#7f8c8d
