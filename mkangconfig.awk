BEGIN{ n=64; # chainlength
  b0=0.967;   # bond length
  x=1;
  nx=1; nz=32; ny=12; # replication (quasi-hexagonal lattice in xz-plane)
  nc=nx*nz*ny #no of chains
  nt=na*n # total no of atoms
  nang=na*(n-2) #no of angles
for(j=0;j<nc;j++)
	{  for(i=1;i<=(n-2);i++)
		{ 	
			print x,1,(j*n)+i,(j*n)+i+1,(j*n)+i+2;
	 	        x++;	
		}
	   	
	}
}
