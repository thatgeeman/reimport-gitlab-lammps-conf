BEGIN { n=16; # chainlength
  b0=0.967;   # bond length
  x=1;
  nx=24; nz=16; ny=1; # replication (quasi-hexagonal lattice in xz-plane)
  nc=nx*nz*ny #no of chains
  nt=na*n # total no of atoms
  nb=na*(n-1) #no of bonds
for(j=0;j<nc;j++)
	{  for(i=1;i<=(n-1);i++)
		{ 	
			print x,1,(j*n)+i,(j*n)+i+1;
	 	        x++;	
		}
	   	
	}
}
