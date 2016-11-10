BEGIN { n=20; # chainlength
  b0=0.75;   # bond length
  nx=24; nz=16; ny=1; # replication (quasi-hexagonal lattice in xz-plane)
  # nx*ny*nz=number of chains
  box=20.0;     # boxsize > ny*(b0*(n-1)+1)
  xx0=0.0; yy0=0.0; zz0=0.0; # origin
  for (j=0; j<ny; j++) {
    y0 = yy0 + j*(box/ny);
    for (k=0; k<nx; k++) {
      x0 = xx0 + k*(box/nx);
      for (l=0; l<nz; l++) {
        z0 = zz0 + (l+0.5*(k%2))*(box/nz);
        pch++;
        print ++p,pch,1,x0,y0,z0,0 ,0,0;
        for (i=1;i<n; i++) print ++p,pch,1, x0,y0+b0*i,z0,0,0,0;
      }
    }
  }
}
