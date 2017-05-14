#    ___
#   |   |
#___|   |
#         : is one hump
#
BEGIN { 
  #variables
  pph=3; # length of 1 horizontal side
  ppv=13; # length of 1 vertical side
  b0=0.967; # bond length
  tn=256;  #total length of chain
  xx0=0.0; yy0=2.0895; zz0=0.0; # origin
  #box size xx > pp*n*2
  #n is no of humps, is also the base and top of the hump
  boxz=40; #controlled
  boxy=40; #has no control basically 
  boxx=128; #has no control basically
  ppt=(pph*2)+(ppv*2); #total distances in one hump
  #parts of the hump
  n1=n3=pph; #hor parts of hump
  n2=n4=ppv; #vertical parts of hump
  n=tn/ppt; #no of humps (average, can float)
  #along y be careful of box size on mdfile (based on pp)
  #along z any number possible
  count=0;
  nx=1; nz=32; ny=12; # replication (quasi-hexagonal lattice in yz-plane)
  # nx*ny*nz=number of chains
  for (k=0; k<nx; k++) {
    x5 = xx0 + k*(boxx/nx);
    for (l=0; l<nz; l++) {
      z0 = zz0 + (l+0.5*(k%2))*(boxz/nz);
     for (j=0; j<ny; j++) {
      x5=y5=0.0;
      y5 = yy0 + j*(boxy/ny);
      pch++; #is 0
      for(t=0;t<n; t++) {	
	  #core parts of one hump
	  #loops for n humps
	  #should run for the last decimal in nested loops
	  for (i=0;i<n1; i++)print ++p,pch,1,x5+b0*i,y5,z0,0,0,0; x2=x5+b0*i; y2=y5; count++; 
	  for (i=0;i<n2; i++)print ++p,pch,1,x2,y2+b0*i,z0,0,0,0; y3=y2+b0*i; x3=x2; count++;
	  for (i=0;i<n3; i++)print ++p,pch,1,x3+b0*i,y3,z0,0,0,0; x4=x3+b0*i; y4=y3; count++;
	  for (i=0;i<n4; i++)print ++p,pch,1,x4,y4-b0*i,z0,0,0,0; y5=y4-b0*i; x5=x4; count++; 
       }
#print count,tn; #count prints no of atoms in one hump

      } 
    }
  }
}
