#!/bin/sh
#
#SBATCH --job-name="lmp_test_nonaveraged"
#SBATCH --account=education-ae-msc-ae
#SBATCH --partition=compute
#SBATCH --time=01:00:00
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=12
#SBATCH --mem-per-cpu=2G
#SBATCH --nodes=1

module load 2023r1
module load intel/oneapi-all

export I_MPI_PMI_LIBRARY=/cm/shared/apps/slurm/current/lib64/libpmi2.so
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

srun ~/lammps/build/lmp -in ./in.simulation
