# Guard

## Content

[About](#about)

[API](#api)

[Examples](#examples)

## About

The `guard` module provides you with opertions to diagnose errors, both system and user specific ones.

## API

### warn_with_sys_msg

```C
void warn_with_sys_msg(const char* msg);
```

The `warn_with_sys_msg` operation provides you with the diagnose message (error description), which is caused by system calls and some library functions in the event of an error to indicate what went wrong. It is highly dependent on the value of [`errno`](https://man7.org/linux/man-pages/man3/errno.3.html).

| Type | Description |
| ---- | ----------- |
| `const char* msg` | A message to give a short information about an error |

**Retrun value**: none

### warn_with_user_msg

```C
void warn_with_user_msg(const char* msg, const char* details);
```

The `warn_with_user_msg` operation provides you with the diagnose message (error description), which is caused by user defined functions. In the [example](#usage-of-warn_with_user_msg) below you can find some ideas on its usage.

| Type | Description |
| ---- | ----------- |
| `const char* msg` | A message to give a short information about an error |
| `const char* details` | Since a user defined functions do not rely on the value of `errno`, you need to provide a way of describing what caused an error |

### Examples

### Usage of `warn_with_sys_msg`

Let's suppose you have a function that allocates `N` bytes of memory with the following prototype:

```C
void* allocate_N_bytes(size_t N);
```

wherever you expect an error caused by the system, call the `warn_with_sys_msg` function:

```C
void* result = NULL;

/* allocate_N_bytes */
if ((result = malloc(N)) != NULL) {
    /* do something */
}
else {
    /* provide a callee with the caller name */
    warn_with_sys_msg(__func__);
}

return result;
```

### Usage of `warn_with_user_msg`

In the example below we have a function that does something on the provided argument `x`:

```C
void func(int* x);
```

for example, if `x` is `NULL`, you can provide a user with the message indicating that the given value is `NULL`, rather than simply ignore `NULL` values:

```C
/* func */
if (x == NULL) {
    warn_with_user_msg(__func__, "provided value is NULL");
}
```
