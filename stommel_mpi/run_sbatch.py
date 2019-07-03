import os

for ijob in range(10):
    for nproc in [1, 2, 4, 8, 12, 16, 24, 48, 72, 96]:
        os.system("cat submit_stommel_parallel_5e4.template | sed -e 's/XXX/%d/; s/YYY/%d/' > submit_stommel_parallel_5e4_%d_%d.sh" % (nproc, ijob, ijob, nproc) )
        os.system("sbatch submit_stommel_parallel_5e4_%d_%d.sh" % (ijob, nproc) )

for ijob in range(10):
    for nproc in [12, 24, 48, 96, 144, 192, 288, 384]:
        os.system("cat submit_stommel_parallel_1e6.template | sed -e 's/XXX/%d/; s/YYY/%d/' > submit_stommel_parallel_1e6_%d_%d.sh" % (nproc, ijob, ijob, nproc) )
        os.system("sbatch submit_stommel_parallel_1e6_%d_%d.sh" % (ijob, nproc) )
