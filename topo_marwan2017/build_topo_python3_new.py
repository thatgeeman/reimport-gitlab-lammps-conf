#1coding: utf-8
topo = open('new.data','w')
#lam  = open('data1.dat', 'w')
N=27 #approx number of blocks of 4 (BS)
Ntemp=N-1
BS=4 #side chain every four atom
BStemp=BS+1
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
nbatom=N*(BS+M)
nbbond=N*(BS+M)-1

topo.write(header)
ii = 1 # atom indice
xx = 0
a= 2
factor=6
topo.write( "%i 1 1 %f %f %f 0 0 0\n" % (1,0,0,0) )
while a < nbatom :
    for k in range(a,(BS*(N-Ntemp))): #loop upto one block (BS) at a time
        topo.write( "%i 1 1 %f %f %f 0 0 0\n" % (k,k-1,0,0) )
        #           atom     x  y  z                x  y  z
        ii=k+1 # point to begin the branch indices
        xx=k
#        a=k-1
    for j in range(a+(BS-1),(M+BS)): #subbranch cord
        if j>(M+BS-factor): #set sub group in sidechain 6th atom id in subchain
           ptype=3 # 1 3
        else: # less than 6
           ptype=2 # 1 2 
       	topo.write("%i 1 %i %f %f %f 0 0 0\n"%(j,ptype,xx,j-(BS+1),0))
    Ntemp -= 1
###
#topo.write("\n")
#topo.write("Bonds\n")
#topo.write("\n")

#nbb=1

#for k  in range(1,BS*N):
 #   topo.write("%i  1 %i %i \n"%(nbb,k,k+1))
#    nbb+=1
 
#for p in range(1,N+1) :
#    topo.write("%i 1 %i %i \n"%(nbb,BS*p,BS*N+1+(p-1)*M))
#    nbb+=1
#for l in range(1,N+1): 
#    for n in range(1,M):
#	topo.write("%i 1 %i %i \n"%(nbb,BS*N+(l-1)*M+n,BS*N+1+(l-1)*M+n))
#        nbb+=1

#topo.close()
