#!/bin/bash
#SBATCH -J  ORCA
#SBATCH -A  PHY191
#SBATCH --nodes 1
#SBATCH -p batch
#SBATCH -t 24:00:00
#SBATCH -o output.out
#SBATCH -e error.out

echo  $SLURM_JOBID

module load aocc/5.0.0
module load openmpi/5.0.5

ulimit -s unlimited
export OMP_STACKSIZE=4G
export OMP_NUM_THREADS=64
export OMP_MAX_ACTIVE_LEVELS=1

input=input-orca

sed -i "1c ! B3LYP D3BJ  def2-TZVP  def2/J RIJCOSX  VeryTightOPT   DEFGRID3   NUMFREQ" input-orca

/ccsopen/home/d2j/software/ORCA/orca_6_0_1_linux_x86-64_shared_openmpi416/orca   $input  > job-$input.log

