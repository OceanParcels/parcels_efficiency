#!/bin/sh
# SGE Options
#$ -S /bin/bash
# Shell environment forwarding
#$ -V
# Job Name
#$ -N benchmark_stommel_MPI
# Notifications
#$ -M c.kehl@uu.nl
# When notified
#$ -m es
# Set memory limit
#$ -l h_vmem=120G
# Set runtime limit
#$ -l h_rt=96:00:00
# run the job on the queue for long-running processes:
#$ -q long.q

echo 'Initialize environment'
#export HOME=/nethome/kehl0001
#export SCRATCH_HOME=/scratch/ckehl
#source ${SCRATCH_HOME}/initParcels.sh

cd /scratch/ckehl
export PARCELS_HEAD=${HOME}/git/parcels
export TARGET_HEAD=/scratch/ckehl/experiments

echo '======== JIT (Just-in-Time) experiments - MPI ========'
echo ' ---- constant particle number ---- '
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_constP_2pow10_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -N 2**10 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_constP-2pow10_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_constP_2pow11_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -N 2**11 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_constP-2pow11_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_constP_2pow12_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -N 2**12 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_constP-2pow12_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_constP_2pow13_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -N 2**13 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_constP-2pow13_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_constP_2pow14_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -N 2**14 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_constP-2pow14_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_constP_2pow15_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -N 2**15 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_constP-2pow15_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_constP_2pow16_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -N 2**16 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_constP-2pow16_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_constP_2pow17_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -N 2**17 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_constP-2pow17_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_constP_2pow18_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -N 2**18 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_constP-2pow18_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_constP_2pow19_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -N 2**19 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_constP-2pow19_wGC_jit.png
echo ' ---- dynamically removing particles (aging with t_max=14 days) ---- '
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageP_2pow10_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -a -t 365 -G -N 2**10 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageP-2pow10_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageP_2pow11_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -a -t 365 -G -N 2**11 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageP-2pow11_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageP_2pow12_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -a -t 365 -G -N 2**12 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageP-2pow12_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageP_2pow13_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -a -t 365 -G -N 2**13 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageP-2pow13_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageP_2pow14_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -a -t 365 -G -N 2**14 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageP-2pow14_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageP_2pow15_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -a -t 365 -G -N 2**15 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageP-2pow15_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageP_2pow16_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -a -t 365 -G -N 2**16 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageP-2pow16_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageP_2pow17_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -a -t 365 -G -N 2**17 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageP-2pow17_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageP_2pow18_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -a -t 365 -G -N 2**18 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageP-2pow18_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageP_2pow19_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -a -t 365 -G -N 2**19 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageP-2pow19_wGC_jit.png
echo ' ---- dynamically adding particles (adaptive release rate) ---- '
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_addP_2pow10_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -r -sN 128 -N 2**10 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_addP-2pow10_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_addP_2pow11_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -r -sN 128 -N 2**11 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_addP-2pow11_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_addP_2pow12_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -r -sN 128 -N 2**12 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_addP-2pow12_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_addP_2pow13_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -r -sN 128 -N 2**13 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_addP-2pow13_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_addP_2pow14_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -r -sN 128 -N 2**14 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_addP-2pow14_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_addP_2pow15_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -r -sN 128 -N 2**15 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_addP-2pow15_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_addP_2pow16_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -r -sN 128 -N 2**16 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_addP-2pow16_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_addP_2pow17_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -r -sN 128 -N 2**17 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_addP-2pow17_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_addP_2pow18_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -r -sN 128 -N 2**18 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_addP-2pow18_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_addP_2pow19_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -t 365 -G -r -sN 128 -N 2**19 -i ${TARGET_HEAD}/stommel_GEMINI_MPI_addP-2pow19_wGC_jit.png
echo ' ---- dynamically adding and removing particles ---- '
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageAddP_2pow10_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -r -sN 128 -N 2**10 -a -t 365 -G -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageAddP-2pow10_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageAddP_2pow11_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -r -sN 128 -N 2**11 -a -t 365 -G -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageAddP-2pow11_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageAddP_2pow12_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -r -sN 128 -N 2**12 -a -t 365 -G -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageAddP-2pow12_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageAddP_2pow13_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -r -sN 128 -N 2**13 -a -t 365 -G -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageAddP-2pow13_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageAddP_2pow14_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -r -sN 128 -N 2**14 -a -t 365 -G -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageAddP-2pow14_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageAddP_2pow15_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -r -sN 128 -N 2**15 -a -t 365 -G -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageAddP-2pow15_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageAddP_2pow16_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -r -sN 128 -N 2**16 -a -t 365 -G -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageAddP-2pow16_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageAddP_2pow17_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -r -sN 128 -N 2**17 -a -t 365 -G -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageAddP-2pow17_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageAddP_2pow18_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -r -sN 128 -N 2**18 -a -t 365 -G -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageAddP-2pow18_wGC_jit.png
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_stommel_GEMINI_MPI_ageAddP_2pow19_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_stommel.py -r -sN 128 -N 2**19 -a -t 365 -G -i ${TARGET_HEAD}/stommel_GEMINI_MPI_ageAddP-2pow19_wGC_jit.png

echo 'Finished program execution.'
