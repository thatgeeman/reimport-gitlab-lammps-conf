BEGIN { n=64; # chainlength
  b0=0.967;   # bond length
  nx=1; nz=32; ny=12; # replication (quasi-hexagonal lattice in yz-plane)
  # nx*ny*nz=number of chains
  boxz=40;    # boxsize > nx*(b0*(n-1)+1)
  boxy=17;
  boxx=63;
  xx0=0.0; yy0=2.0895; zz0=0.0; # origin
  for (k=0; k<nx; k++) {
    x0 = xx0 + k*(boxx/nx);
     for (l=0; l<nz; l++) {
      z0 = zz0 + (l+0.5*(k%2))*(boxz/nz);
       for (j=0; j<ny; j++) {
       y0 = yy0 + j*(boxy/ny);
       pch++;
       print ++p,pch,1,x0,y0,z0,0 ,0,0;
       for (i=1;i<n; i++) print ++p,pch,1, x0+b0*i,y0,z0,0,0,0; #giving a slope
      }
    }
  }
}
