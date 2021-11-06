# BRAM Initialization test

This project tests of BRAM initialization by `$readmemh` in `initial`-statement.

## Environment

- Vivado 2020.2
- Digilent Arty

## Build and test

```
$ vivado -mode batch -source ./create_project.tcl
```

Download generated bitfile `top.bit` and load `top.ltx`, and you can read/write BRAM contents via VIO. The contents has been initialized by `$readmemh` as written in `sources/memtest.hex`.
