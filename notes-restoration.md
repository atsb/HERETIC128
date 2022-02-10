## WARNING: DO NOT TRY TOO HARD TO BUILD ANY OF THE ORIGINAL EXECUTABLES! ##

Please remember that any little difference, not matter how small it is,
can lead to a vastly different EXE layout. This includes differences in:

- The development tools (or parts of such); For instance, a compiler, a linker,
an assembler, or even a support library or header. A version number is not
a promise for having the exact tool used to reproduce some executable.
- The order in which source code files are listed in a given project or
makefile.
- Project settings.
- Source file specific settings in such a project.
- The order in which object or library files are passed to a linker.
- Any modification to a source code file (especially a header file).
- More than any of the above.

Following the warning, a description of the ways in which the executables were
reproduced is given.

With the right tools, this patched codebase can be used
for reproducing the executables coming from the following
original releases of Heretic, with a few caveats:

- Shareware Heretic 3-level beta.
- Shareware Heretic 1.0 and Registered Heretic 1.0.
- Heretic 1.2 and Heretic: Shadow of the Serpent Riders 1.3.

The MAKEFILE bundled with the Heretic sources was used as a base.
You shall *not* call "wmake" as-is. Instead, use DOBUILD.BAT.

List of releases by directory names
-----------------------------------

- TICSBETA: Shareware Heretic 3-level beta.
- TIC10S: Shareware Heretic 1.0.
- TIC10R: Registered Heretic 1.0.
- TIC12: Heretic 1.2.
- TIC13: Heretic: Shadow of the Serpent Riders 1.3.

Technical details of the original EXEs (rather than any recreated one)
----------------------------------------------------------------------

|     Version    | N. bytes |               MD5                |  CRC-32  |
|----------------|----------|----------------------------------|----------|
| 3-level beta   |  717151  | 052f82fece58fa38db40713cbbcc675d | a2b2c52a |
| Shareware 1.0  |  717239  | 018a983abb1b778ad04f06d5538f3769 | a3a3758f |
| Registered 1.0 |  717239  | a4673989b453257501821d920ceb3e2a | 499749d7 |
| 1.2            |  728031  | ebf05fc6af60aabe473b02bc8b3b47cd | e8a84e57 |
| 1.3            |  728031  | 8f7b6ba0ca9f78f5f9004a3ec946acd1 | 3b15558c |

How to identify code changes (and what's this HERETICREV thing)?
----------------------------------------------------------------

Check out GAMEVER.H. Basically, for each EXE being built, the
macro APPVER_EXEDEF should be defined accordingly. For instance,
when building TIC10R, APPVER_EXEDEF is defined to be TIC10R.

Note that only C sources (and not ASM) are covered by the above, although
I_IBM_A.ASM and LINEAR.ASM are identical across the given versions.

Other than GAMEVER.H, the APPVER_EXEDEF macro is not used *anywhere*.
Instead, other macros are used, mostly APPVER_HERETICREV.

Any new macro may also be introduced if useful.

APPVER_HERETICREV is defined in all builds, with different values. It is
intended to represent a revision of development of the Heretic codebase.
Usually, this revision value is based on some evidenced date, or alternatively
a *guessed* date (say, an original modification date of the EXE).
Any other case is also a possibility.

These are two good reasons for using HERETICREV as described above, referring
to similar work done for Wolfenstein 3D EXEs (built with Borland C++):

- WL1AP12 and WL6AP11 share the same code revision. However, WL1AP11
is of an earlier revision. Thus, the usage of WOLFREV can be
less confusing.
- WOLFREV is a good way to describe the early March 1992 build. While
it's commonly called just "alpha" or "beta", GAMEVER_WOLFREV
gives us a more explicit description.

Is looking for "#if (APPVER_HERETICREV <= AV_HR_...)" (or >) sufficient?
------------------------------------------------------------------------

Nope!

Examples from Wolf3D/SOD:

For a project with GAMEVER_WOLFREV == GV_WR_SDMFG10,
the condition GAMEVER_WOLFREV <= GV_WR_SDMFG10 holds.
However, so does GAMEVER_WOLFREV <= GV_WR_WJ6IM14,
and also GAMEVER_WOLFREV > GV_WR_WL1AP10.
Furthermore, PML_StartupXMS (ID_PM.C) has two mentions of a bug fix
dating 10/8/92, for which the GAMEVER_WOLFREV test was chosen
appropriately. The exact range of WOLFREV values from this test
is not based on any specific build/release of an EXE.

What is this based on
---------------------

This codebase was originally based on the open-source release of Heretic,
which turned out to match version 1.3 in behaviors.

Special thanks go to John Romero, Simon Howard, Mike Swanson, Frank Sapone,
Nuke.YKT, Evan Ramos and anybody else who deserves getting thanks.

What is *not* included
----------------------

As with Raven's original open source release, you won't find any of the files
from the DMX sound library. They're still required for making the EXEs in
such a way that their layouts will be as close to the originals' as possible.

Alternatively, to make a functioning EXE consisting of GPL-compatible sound
code for the purpose of having a test playthrough, you can use a replacement.
One which may currently be used is the Apogee Sound System backed DMX wrapper.
As expected, it'll sound different, especially the music.

Building any of the EXEs
========================

Required tools:

- For v1.0 and earlier: Watcom C 9.5a; No other version, not even 9.5 or 9.5b.
- For versions 1.2 and 1.3: Watcom C 10.0 and exactly this version.
- For all game versions: Turbo Assembler 3.1.

Additionally:

- For mostly proper EXE layouts (albeit still with a few exceptions),
the dmx33gs headers and the dmx34a library should be used.
- Alternatively, if you just want to get an EXE with entirely GPL-compatible
code for checking the game (e.g., watching the demos), you can use the
Apogee Sound System backed DMX wrapper. In such a case,
the Apogee Sound System v1.09 will also be used.

Notes before trying to build anything:

- As previously mentioned, the EXEs will surely have great
differences in the layouts without access to the original DMX files.
- Even with access to the correct versions of DMX, Watcom C and
Turbo Assembler, this may depend on luck. In fact, the compiler
may generate the contents of a function body a bit differently if
an additional environment variable is defined, or alternatively,
if a macro definition is added. M_FindResponseFile is an example
of a function for which an unexpected layout change was observed.
- Even if there are no such issues, versions of Watcom C like 9.5a or 10.0
are known to insert data between C string literals, which appears to depend
on the environment, and/or the contents of the processed source codes.
- There will also be minor differences stemming from the use of the __LINE__
macro within I_Error, along with __FILE__ for G_OLD.C as of v1.0 and earlier.

Building any of the Heretic EXEs
================================

1. Use DOBUILD.BAT, selecting the output directory name (say TIC10R),
depending on the EXE that you want to build. In case you want to use
the DMX wrapper, enter "DOBUILD.BAT USE_APODMX".
2. Hopefully you should get an EXE essentially behaving like the original,
with a possible exception for the DMX sound code.

Expected differences from the original (even if matching DMX files are used):

- A few unused gaps, mostly between C string literals, seem to be filled
with values depending on the environment while running the Watcom C compiler
(e.g., the exact contents of each compilation unit). This seems to be related
to Watcom C 10.0b and earlier versions, and less to 10.5, 10.6 or 11.0.
- The created STRIPTIC.EXE file will require an external DOS4GW EXE
(or compatible). You may optionally use DOS/4GW Professional to bind
its loader to the EXE, but inspection of the EXE layout wasn't done.
- As stated above, there are a few mentions of the __LINE__ macro via I_Error,
which will translate to numbers differing from the originals in a portion of
the cases; Same with a mention of G_OLD.C via __FILE__, for v1.0 and earlier.
- While this will probably not occur, in case of having a bit less luck,
global variables might get internally ordered in a bit different manner,
compared to the original EXE.
- Furthermore, again as stated earlier, the compiler might generate
a bit different code for specific function bodies.
