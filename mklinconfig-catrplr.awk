BEGIN { 
  pp=16; # length of 1 block
  tn=256;  #total length of chain
  pp4=pp*4; #4 blocks of chains made in each loop
  n1=n2=n3=n4=pp; 
  n=tn/pp4; #no of blocks
  b0=0.967; # bond length
  nx=1; nz=1; ny=1; # replication (quasi-hexagonal lattice in yz-plane)
  # nx*ny*nz=number of chains
  
  boxz=40;    # boxsize > nx*(b0*(n-1)+1)
  boxy=40;
  boxx=124;
  xx0=0.0; yy0=0.0; zz0=0.0; # origin
  for (k=0; k<nx; k++) {
    x0 = xx0 + k*(boxx/nx);
     for (l=0; l<nz; l++) {
      z0 = zz0 + (l+0.5*(k%2))*(boxz/nz);
       for (j=0; j<ny; j++) {
       y0 = yy0 + j*(boxy/ny);
       pch++;
       s=1;
       print ++p,pch,1,x0,y0,z0,0,0,0;
       for(t=1;t<=n; t++) {	
	       for (i=s;i<n1; i++) print ++p,pch,1,x5+b0*i,y5,z0,0,0,0; ++q; x2=x5+b0*i; y2=y5;
	       for (i=q;i<n2; i++) print ++p,pch,1,x2,y2+b0*i,z0,0,0,0; ++p; y3=y2+b0*i; x3=x2;
	       for (i=p;i<n3; i++) print ++p,pch,1,x3+b0*i,y3,z0,0,0,0; ++r; x4=x3+b0*i; y4=y3;
	       for (i=r;i<n4; i++) print ++p,pch,1,x4,y4-b0*i,z0,0,0,0; ++s; y5=y4-b0*i; x5=x4;
		
       }
      }
    }
  }
}
