# Estimation of Multi-Variate Ornstein-Uhlenbeck Wind Process

This repository contains a dataset and a script for modeling wind as a
stochastic process. It consists of three folders, described below.

## Dataset

Wind data from Hollandse Kust Noord (site B).

### Description

Wind data from Hollandse Kust Noord (site B), originally published by
Netherlands Enterprise Agency (RVO).
The dataset includes measurements from 2017-04-10 to 2019-04-10, in 10-minute intervals.
The data includes:

* **time** of the measurement (in "%Y-%m-%dT%H:%M:%OSZ" format, e.g.,
  "2017-04-10T00:00:00Z"),
* **direction** of the wind (in degrees, from north)
* **speed** (in m/s)
* **ti** (turbulence intensity, unitless)
* **veer** (in degrees/m)
* **shear** (in 1/s)

### Tags

wind, offshore wind, Hollandse Kust, the Netherlands

## Script

Multi-variate Ornstein-Uhlenbeck wind estimator

### Description

This script is used for modeling wind as a stochastic process. The estimation is based on historical data and uses a
model called multi-variate
Ornstein-Uhlenbeck (MVOU) process. This wind process is used in experiments
presented in
[Neustroev, G., Andringa, S. P., Verzijlbergh, R. A., & De Weerdt, M. M. (2022, May). _Deep Reinforcement Learning for
Active Wake
Control._ In Proceedings of the 21st International Conference on Autonomous Agents and Multiagent Systems (pp. 944-953).](https://www.ifaamas.org/Proceedings/aamas2022/pdfs/p944.pdf)

### Tags

wind, stochastic process, wind simulation, multi-variate
Ornstein-Uhlenbeck process, wind modeling

## Outputs

The output folder contains a sample output file.

# How to Use This Repository

You need to install R and two libraries, `yaml` (for writing the output), and
`pracma` (for matrix algebra). The main script is `script/estimate_wind.R`.
It takes a single command line argument, which is the path to the input file.
To run the script, use the following command from the script directory:

```
Rscript estimate_wind.R PATH_TO_THE_DATASET
```

Here `PATH_TO_THE_DATASET` is either `"../dataset/HKNB.csv"` or another file in
the same format.

If you want to run and manage this from the EnergySHR platform, you would have to provide the following arguments for
the algorithm during publishing, where $ALGO will be replaced with the link from the algorithm file (estimate_wind.R)
and $INPUT with the dataset file

```
Rscript $ALGO /data/inputs/<id_of_dataset>/0
```

## Citation

Please, cite the paper if you use it:

```
@inproceedings{Neustroev2022,
  title     = {Deep Reinforcement Learning for Active Wake Control},
  author    = {Neustroev, Grigory and Andringa, Sytze P.E. and Verzijlbergh, Remco A. and de~Weerdt, Mathijs M.},
  booktitle = {International Conference on Autonomous Agents and Multi-Agent Systems},
  year      = {2022},
  address   = {Online},
  publisher = {IFAAMAS},
  month     = {May},
  numpages  = {10}
}
```
