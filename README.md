# BRAM Initialization test

This project tests of BRAM initialization by `$readmemh` in `initial`-statement.

## Environment

- Vivado 2020.2
- Digilent Arty

or

- Quartus Lite 20.1
- DE0-CV

## Build and test

### Vivado

```
$ vivado -mode batch -source ./create_project.tcl
```

Download generated bitfile `prj/memtest.runs/impl_1/top.bit` and load `prj/memtest.runs/impl_1/top.ltx`, and you can read/write BRAM contents via VIO. The contents has been initialized by `$readmemh` as written in `sources/memtest.hex`.

### Quartus

```
$ sh quartus.sh
```

Run `quartus_stpw`, open `sources/stp1.stp`, and download `output_files/memtest.sof` into DE0-CV. You can see the memory contents according to positions of DIP SWs.

