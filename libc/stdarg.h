#ifndef _STDARG_H_
#define _STDARG_H_

#ifndef __GNUC__
typedef struct {
    char gpr;
    char fpr;
    char reserved[2];
    char* input_arg_area;
    char* reg_save_area;
} __va_list[1];
typedef __va_list va_list;

extern void __builtin_va_info(void*);
#endif

#ifdef ALT_MWCC_VA
#define va_start(ap, fmt) (ap = ((va_list)&fmt + sizeof(fmt)))
#define va_arg(ap, t) (*((t*)__va_arg(ap, _var_arg_typeof(t))))
#define va_end(ap) (void)0
#elif (defined __MWERKS__)
#define va_start(ap, fmt) ((void)fmt, __builtin_va_info(&ap))
#define va_arg(ap, t) (*((t*)__va_arg(ap, _var_arg_typeof(t))))
#define va_end(ap) (void)0
#else
// When building with modern GCC, use the official vaarg macros to avoid warnings and possibly bad codegen.
#define va_list  __builtin_va_list
#define va_start __builtin_va_start
#define va_arg   __builtin_va_arg
#define va_end   __builtin_va_end
#define _var_arg_typeof(e) 0
#endif

void* __va_arg(va_list v_list, unsigned char type);

#endif
