#    ___
#   |   |
#___|   |
#         : is one hump
#
BEGIN { 
  #variables
  pp=16; # length of 1 side
  b0=0.967; # bond length
  tn=256;  #total length of chain
  #box size xx > pp*n*2
  #n is no of humps, is also the base and top of the hump
  boxz=40;    
  boxy=40;
  boxx=256; #has no effect basically

  pp4=pp*4; #1 hump made in each loop
  n1=n2=n3=n4=pp; 
  n=tn/pp4; #no of humps 
  nx=1; nz=1; ny=1; # replication (quasi-hexagonal lattice in yz-plane)
  # nx*ny*nz=number of chains
  
  xx0=0.0; yy0=0.0; zz0=0.0; # origin
  for (k=0; k<nx; k++) {
    x5 = xx0 + k*(boxx/nx);
     for (l=0; l<nz; l++) {
      z0 = zz0 + (l+0.5*(k%2))*(boxz/nz);
       for (j=0; j<ny; j++) {
       y5 = yy0 + j*(boxy/ny);
       s=1;
       pch++;
       print ++p,pch,1,x5,y5,z0,0,0,0;
       for(t=1;t<=n; t++) {	
	       #core parts of one hump
	       #loops for n humps
	       q=p=r=s=0;
	       for (i=s;i<=n1; i++) print ++p,pch,1,x5+b0*i,y5,z0,0,0,0; ++q; x2=x5+b0*i; y2=y5; #1-16; 80-96; 132-164; 200-216
	       for (i=q;i<=n2; i++) print ++p,pch,1,x2,y2+b0*i,z0,0,0,0; ++p; y3=y2+b0*i; x3=x2; #16-32; 96-100; 164-180; 216-232
	       for (i=p;i<=n3; i++) print ++p,pch,1,x3+b0*i,y3,z0,0,0,0; ++r; x4=x3+b0*i; y4=y3; #32-48; 100-116; 180-196; 232-248
	       for (i=r;i<=n4; i++) print ++p,pch,1,x4,y4-b0*i,z0,0,0,0; ++s; y5=y4-b0*i; x5=x4; #64-80; 116-132; 196-200; 248-264
       }

      }
    }
  }
}
