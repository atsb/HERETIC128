// *** VERSIONS RESTORATION ***
#ifndef GAMEVER_H
#define GAMEVER_H

// It is assumed here that:
// 1. The compiler is set up to appropriately define APPVER_EXEDEF
// as an EXE identifier.
// 2. This header is included (near) the beginning of every compilation unit,
// in order to have an impact in any place where it's expected to.

// APPVER_HERETICREV definitions
#define AV_HR_TICSBETA 199412200
#define AV_HR_TIC10S 199412230
#define AV_HR_TIC10R 199412270
#define AV_HR_TIC12 199506270
#define AV_HR_TIC13 199603220

// Now define APPVER_HERETICREV to one of the above, based on APPVER_EXEDEF

#define APPVER_CONCAT1(x,y) x ## y
#define APPVER_CONCAT2(x,y) APPVER_CONCAT1(x,y)
#define APPVER_HERETICREV APPVER_CONCAT2(AV_HR_,APPVER_EXEDEF)

#endif // GAMEVER_H
