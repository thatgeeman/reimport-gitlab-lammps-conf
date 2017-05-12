#    ___
#   |   |
#___|   |
#         : is one hump
#
BEGIN { 
  #variables
  pph=4; # length of 1 horizontal side
  ppv=16; # length of 1 vertical side
  b0=0.967; # bond length
  tn=256;  #total length of chain
  #box size xx > pp*n*2
  #n is no of humps, is also the base and top of the hump
  boxz=40;    
  boxy=40;
  boxx=128; #has no effect basically
  ppt=(pph*2)+(ppv*2); #total distances in one hump
  #parts of the hump
  n1=n3=pph; #hor parts of hump
  n2=n4=ppv; #vertical parts of hump
  n=tn/ppt; #no of humps (average, can float)
  #along y be careful of box size on mdfile (based on pp)
  #along z any number possible
  nx=1; nz=32; ny=12; # replication (quasi-hexagonal lattice in yz-plane)
  # nx*ny*nz=number of chains
  xx0=0.0; yy0=0.0; zz0=0.0; # origin
  for (k=0; k<nx; k++) {
    x5 = xx0 + k*(boxx/nx);
    for (l=0; l<nz; l++) {
      z0 = zz0 + (l+0.5*(k%2))*(boxz/nz);
     for (j=0; j<ny; j++) {
      x5=y5=0.0;
      y5 = yy0 + j*(boxy/ny);
      s=1; hump=0;
      pch++;
      print ++p,pch,1,x5,y5,z0,0,0,0;
      for(t=1;t<=n; t++) {	
       #core parts of one hump
       #loops for n humps
        q=w=r=s=0;
	#should run for the last decimal in nested loops
        for (i=s;i<=n1; i++) print ++p,pch,1,x5+b0*i,y5,z0,0,0,0; ++q; x2=x5+b0*i; y2=y5;
	for (i=q;i<=n2; i++) print ++p,pch,1,x2,y2+b0*i,z0,0,0,0; ++w; y3=y2+b0*i; x3=x2;
	for (i=w;i<=n3; i++) print ++p,pch,1,x3+b0*i,y3,z0,0,0,0; ++r; x4=x3+b0*i; y4=y3;
	for (i=r;i<=n4; i++) print ++p,pch,1,x4,y4-b0*i,z0,0,0,0; ++s; y5=y4-b0*i; x5=x4;
	} 
      }
    }
  }
}
