# Guard

The set of functions to describe and/or diagnose errors.

## API

### warn_with_sys_msg

```C
void warn_with_sys_msg(const char* msg);
```

The function takes the only argument - `msg`, which is a message describing your error.

### warn_with_user_msg

```C
void warn_with_user_msg(const char* msg, const char* details);
```

The first argument is the same as for `warn_with_sys_msg`. Since the function doesn't use `errno` to diagnose the errro, you provide details to describe it. used primaraly with user-defined functions.

### Examples

I prefer to use the following semantics (you may see it in my *first-class ADTs* repos):

```C
/* in a function */
/* ... */
int result = 0;

if (/* something is true */) {
    /* do something */

    result = 1;
}
else {
    warn_with_sys_msg(__func__);
    /* warn_with_user_msg(__func__, "The details of a problem"); */
}

return result
```
