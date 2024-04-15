#!/bin/sh
#
#SBATCH --job-name="lmp_test_nonaveraged"
#SBATCH --account=education-ae-msc-ae
#SBATCH --partition=compute
#SBATCH --time=12:00:00
#SBATCH --ntasks=12
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=1G
#SBATCH --nodes=1

module load 2023r1
# module load intel/oneapi-all

export I_MPI_PMI_LIBRARY=/cm/shared/apps/slurm/current/lib64/libpmi2.so
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

srun ~/lammps/build/lmp -sf omp -in ./in.equilibrium
