#1coding: utf-8
topo = open('new.data','w')
#lam  = open('data1.dat', 'w')
N=27 #approx number of blocks of 4 (BS)
BS=4 #side chain every four atom
M=15  #number of atoms per arm
#lam.write("%i\n"%(N))
#lam.write("%i"%(M))

header="""LAMMPS data file from template

{nbatom} atoms
{nbbond} bonds
0 angles
0 dihedrals
0 impropers

3 atom types
1 bond types
0 angle types
0 dihedral types
0 improper types

0 {xhi} xlo xhi
0 {yhi} ylo yhi
0     2 zlo zhi

Masses

1 1
2 1
3 1

Atoms

""".format(nbatom=N*(BS+M),nbbond=N*(BS+M)-1,xhi=N*BS,yhi=M+2)
#print(header+"###")
topo.write(header)
for i in range(1,BS*N+1):
    #print("%i 1 1 %f %f %f 0 0 0"%(i,i-1,0,0))
    topo.write("%i 1 1 %f %f %f 0 0 0\n"%(i,i-1,0,0))
for i in range(BS,BS*N+1,BS):
    for j in range(1,M+1):
        #print("%i 1 2 %f %f %f 0 0 0"%(BS*N+(i-BS)/BS*M+j,i-1,j,0))
        if j>6:
            ptype=3
        else:
            ptype=2
	topo.write("%i 1 %i %f %f %f 0 0 0\n"%(BS*N+(i-BS)/BS*M+j,ptype,i-1,j,0))

#print("")
#print("Bonds")
#print("")
topo.write("\n")
topo.write("Bonds\n")
topo.write("\n")

nbb=1

for k  in range(1,BS*N):
    #print("%i  1 %i %i "%(nbb,k,k+1))
    topo.write("%i  1 %i %i \n"%(nbb,k,k+1))
    nbb+=1
 
for p in range(1,N+1) :
    #print("%i 1 %i %i "%(nbb,BS*p,BS*N+1+(p-1)*M))
    topo.write("%i 1 %i %i \n"%(nbb,BS*p,BS*N+1+(p-1)*M))
    nbb+=1
for l in range(1,N+1): 
    for n in range(1,M):
        #print("%i 1 %i %i "%(nbb,BS*N+(l-1)*M+n,BS*N+1+(l-1)*M+n))
	topo.write("%i 1 %i %i \n"%(nbb,BS*N+(l-1)*M+n,BS*N+1+(l-1)*M+n))
        nbb+=1

topo.close()
#lam.close()




"""
topo = open('topo.txt','w')
#lam  = open('data1.dat', 'w')
N=10
for i in range(1,BS*N+1):
    topo.write("%i 1 1 %f %f %f 0 0 0"%(i,i-1,0,0))
    print("%i 1 1 %f %f %f 0 0 0"%(i,i-1,0,0))
for i in range(BS,BS*N+1,BS):
    for j in range(1,9):
        topo.write("%i 1 1 %f %f %f 0 0 0"%(BS0+(i-BS)/BS*8+j,i-1,j,0))
topo.write("")
topo.write("Bonds")
topo.write("")
print("")
print("Bonds")
print("")
for k  in range(1,BS*N):
    topo.write("%i  1 %i %i "%(k,k,k+1))
    print("%i  1 %i %i "%(k,k,k+1))
for p in range(1,N) :
    topo.write("%i  1 %i %i "%(BS*N+p,BS*p,BS1+(p-1)*8))
    print("%i  1 %i %i "%(BS*N+p,BS*p,BS1+(p-1)*8))
for l in range(1,10): 
    for n in range(1,8):
        topo.write("%i  1 %i %i "%(BS0+(l-1)*8+n+7,BS0+(l-1)*8+n,BS1+(l-1)*8+n))
        print("%i  1 %i %i "%(BS0+(l-1)*8+n+7,BS0+(l-1)*8+n,BS1+(l-1)*8+n))
topo.close()



#"topo.write("Bonds",file=topo)"
"""
