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

double __fabs(double x);
double __frsqrte(double x);
int __rlwimi(int a, int b, int c, int d, int e);
void __sync(void);
#endif

#endif
