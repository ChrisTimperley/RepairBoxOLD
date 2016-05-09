#!/bin/bash
#
# Installs the benchmarks repository to the VM.
# Changes are no longer synced, except through pushing and pulling from the
# remote GitHub repo.
#
if [ ! -d /home/vagrant/benchmarks ]; then
  cd /home/vagrant
  #wget https://github.com/ChrisTimperley/AutomatedRepairBenchmarks.c/archive/master.zip -q -O /home/vagrant/benchmarks.zip
  #unzip benchmarks.zip
  #rm benchmarks.zip -f
  #mv AutomatedRepairBenchmarks.c-master benchmarks
  git clone https://github.com/ChrisTimperley/AutomatedRepairBenchmarks.c benchmarks
fi
