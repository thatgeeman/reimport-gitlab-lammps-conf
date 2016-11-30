BEGIN { n=16; # chainlength
  x=1;
  nx=24; nz=16; ny=1; # replication (quasi-hexagonal lattice in xz-plane)
  nc=nx*nz*ny #no of chains

for(j=0;j<nc;j++)
	{  for(i=1;i<n;i++)
		{
			print x,1,(j*n)+i,(j*n)+i+1,(j*n)+i+2;
	 	  x++;
      if (((j*n)+i+2)%16==0) {
        # then-body
        i+=1;
      }
		}

	}
}
