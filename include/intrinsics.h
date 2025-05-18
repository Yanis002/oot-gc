#ifndef INTRINSICS_H
#define INTRINSICS_H

#ifdef __MWERKS__
int __cntlzw(unsigned int n);
void __dcbz(void* ptr, int n);
double __fabs(double x);
double __frsqrte(double x);
int __rlwimi(int a, int b, int c, int d, int e);
void __sync(void);
#else
//! TODO: check if this is fine lol
inline int __cntlzw(unsigned int n) {
    int ret;
    __asm__("cntlzw %0, %1" : "=r" (ret) : "r" (n));
    return ret;
}

inline void __dcbz(void* ptr, int n) {
    __asm__("dcbz %0, %1" : "=r" (ptr) : "r" (n));
}

inline double __fabs(double x) {
    return x >= 0 ? x : -x;
}

inline double __frsqrte(double x) {
    double d;
    __asm__("frsqrte %0, %1" : "=r" (d) : "r" (x));
    return d;
}

inline int __rlwimi(int a, int b, int c, int d, int e) {
    unsigned int rotated = (a << c) | (a >> (32 - c));
    unsigned int mask = e <= d ? ((1UL << (e - d + 1)) - 1) << (31 - e) : ((1UL << (32 - d)) - 1) | (((1UL << (e + 1)) - 1) << (31 - e));
    return (b & ~mask) | (rotated & mask);
}

#define __sync() __asm__("sync")

#endif

#endif
