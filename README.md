# benchmark

> parameters

| param        | options                                            | default       |
| ------------ | -------------------------------------------------- | ------------- |
| loop count   | 1~N                                                | 4             |
| num threads  | 1~N                                                | max_cpu_count |
| powersave    | 0=all cores, 1=little cores only, 2=big cores only | 0             |
| gpu device   | -1=cpu-only, 0=gpu0, 1=gpu1 ...                    | -1            |
| cooling down | 0=disable, 1=enable                                | 1             |

> run-bench.sh

```shell
# run model benchmark on big cores cluster
sh run-bench.sh -b

# run model benchmark on small cores cluster
sh run-bench.sh -s

# run model benchmark on gpu with different threads
sh run-bench.sh -g
```

> performance mode

- run benchmark at performance governor: https://github.com/WANNA959/dvfs-settings

> vgg16（单位：ms）

- big cores
  - 1 threads: 189.97
  - 2 threads: 101.54
  - 3 threads: 79.57
  - 4 threads: 66.87
- small cores
  - 1 threads: 967.18
  - 2 threads: 456.20
  - 3 threads: 312.41
  - 4 threads: 225.84
- gpu（stable）
  - 1 big threads: 70.18
  - 2 big threads: 69.95
  - 3 big threads: 69.88
  - 4 big threads: 69.46
  - 1 small threads: 72.61
  - 2 small threads: 71.65
  - 3 small threads: 71.43
  - 4 small threads: 69.46

