from parcels import (FieldSet, ParticleSet, JITParticle,
                     Variable, AdvectionRK4)
import numpy as np
import math
from datetime import timedelta as delta
import time as clock
import os
from argparse import ArgumentParser
from mpi4py import MPI


comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

def stommel_fieldset(xdim=200, ydim=200):
    a = 10000 * 1e3
    b = 10000 * 1e3
    scalefac = 0.05  # to scale for physically meaningful velocities

    # Coordinates of the test fieldset (on A-grid in deg)
    lon = np.linspace(0, a, xdim, dtype=np.float32)
    lat = np.linspace(0, b, ydim, dtype=np.float32)

    # Define arrays U (zonal), V (meridional), W (vertical) and P (sea
    # surface height) all on A-grid
    U = np.zeros((lon.size, lat.size), dtype=np.float32)
    V = np.zeros((lon.size, lat.size), dtype=np.float32)
    P = np.zeros((lon.size, lat.size), dtype=np.float32)

    beta = 2e-11
    r = 1/(11.6*86400)
    es = r/(beta*a)

    for i in range(lon.size):
        for j in range(lat.size):
            xi = lon[i] / a
            yi = lat[j] / b
            P[i, j] = (1 - math.exp(-xi/es) - xi) * math.pi * np.sin(math.pi*yi)*scalefac
            U[i, j] = -(1 - math.exp(-xi/es) - xi) * math.pi**2 * np.cos(math.pi*yi)*scalefac
            V[i, j] = (math.exp(-xi/es)/es - 1) * math.pi * np.sin(math.pi*yi)*scalefac

    data = {'U': U, 'V': V, 'P': P}
    dimensions = {'lon': lon, 'lat': lat}
    return FieldSet.from_data(data, dimensions, mesh='flat', transpose=True)


def UpdateP(particle, fieldset, time):
    particle.p = fieldset.P[time, particle.depth, particle.lat, particle.lon]


def stommel_pset(fieldset, npart=1):
    
    class MyParticle(JITParticle):
        p = Variable('p', dtype=np.float32, initial=0.)
        p_start = Variable('p_start', dtype=np.float32, initial=fieldset.P)

    return ParticleSet.from_line(fieldset,
                                 size=npart,
                                 pclass=MyParticle,
                                 start=(10e3, 5000e3),
                                 finish=(1000e3, 5000e3),
                                 time=0)


comm.Barrier()
if rank == 0:
    tic = clock.time()
comm.Barrier()
        
fset = stommel_fieldset()

comm.Barrier()
if rank == 0:
    tic_pset = clock.time()
comm.Barrier()

pset = stommel_pset(fset, npart=50000)

comm.Barrier()
if rank == 0:
    tac_pset = clock.time()
comm.Barrier()

kernel = AdvectionRK4 + pset.Kernel(UpdateP)


p = ArgumentParser(description="""
blablabla""")
p.add_argument('-j', '--job_id', type=int, default=1,
               help='job_id')
args = p.parse_args()

comm.Barrier()
if rank == 0:
    toc = clock.time()
comm.Barrier()


pset.execute(kernel,
             runtime=delta(days=365*50),
             dt=delta(hours=1))

comm.Barrier()
if rank == 0:
    tac = clock.time()
    ofile = 'stommel_mpi_scaling_long_5e4_50years.log'
    f = open(ofile, 'a')
    f.write('CPU time on %02d procs is: %g (%g %g) job id: %d\n' %
            (size, tac-tic, tac-toc, tac_pset-tic_pset, args.job_id))
    f.close()
