#include<stdio.h>
void main()
{ int i,j;
  int n=20; # chainlength
  float b0=0.75;   # bond length
  int x=1;
  int nx=24, int nz=16, int ny=1;
 # replication (quasi-hexagonal lattice in xz-plane)
  int nc = nx*nz*ny #no of chains
  int nt=na*n # total no of atoms
  int nb=na*(n-1) #no of bonds
  for(j=0;j<nc;j++)
	{  for(i=1;i<=(n-1);i++)
		{
			printf(%i 1 %i %i; x,(j*n)+i,(j*n)+i+1);
	 	        x++;
		}
	}
}
