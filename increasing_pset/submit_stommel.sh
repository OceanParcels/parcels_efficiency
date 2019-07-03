#!/bin/bash

#SBATCH -t 1-00:00:00
#SBATCH -n 1 

##SBATCH -p short    # request partition 'short'
##SBATCH -t 0-01:00:00

# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL
#SBATCH --mail-user=p.b.delandmeter@uu.nl

cd /home/philippe/parcels_efficiency/stommel/stommel_mpi_long

source activate py3_parcels_mpi

python stommel_mpi_npart.py -p 1
python stommel_mpi_npart.py -p 10
python stommel_mpi_npart.py -p 100
python stommel_mpi_npart.py -p 1000
python stommel_mpi_npart.py -p 10000
python stommel_mpi_npart.py -p 100000
python stommel_mpi_npart.py -p 500000
python stommel_mpi_npart.py -p 1000000

echo 'job completed'
