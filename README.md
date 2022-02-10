# HERETIC128
A HERETIC extension for DOS using increased limits beyond what vanilla and executable hacks provide.

This affects version 1.3 of HERETIC.  Other versions can be built if wanted.

# Why
Because having a DOS compatible HERETIC source port that increases the limits beyond what various executable hacks does is useful in playing modern WADS on DOS (where possible).

HERETIC128 is a friendly fork of the amazing restoration work done here:
https://bitbucket.org/gamesrc-ver-recreation/heretic/src/master/

In short, it is about as vanilla as you will get and is compiled using the correct WATCOM version.

Please note, HERE128.EXE binaries are built using the original DMX library.  You won't be able to build it if you don't have it or don't use the APODMX wrapper (see the gamesrc recreation link).

# Limits
MAXVISSPRITES    1024 * 16

SAVESTRINGSIZE 32

MAXLINEANIMS        16384 * 16

MAXPLATS    7680 * 16

MAXVISPLANES    1024 * 16

MAXOPENINGS        SCREENWIDTH*256 * 16

MAXDRAWSEGS        2048 * 16

MAXSEGS (SCREENWIDTH / 2 + 1) * SCREENHEIGHT

# Save size is different depending on version

SAVEGAMESIZE 0x20000 * 16

SAVEGAMESIZE 0x30000 * 16