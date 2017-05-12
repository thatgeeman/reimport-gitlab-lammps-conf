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
  
 nx=1; nz=1; ny=1; # replication (quasi-hexagonal lattice in yz-plane)
  # nx*ny*nz=number of chains
  for (k=0; k<nx; k++) {
    x5 = xx0 + k*(boxx/nx);
    for (l=0; l<nz; l++) {
      z0 = zz0 + (l+0.5*(k%2))*(boxz/nz);
     for (j=0; j<ny; j++) {
      x5=y5=0.0;
      y5 = yy0 + j*(boxy/ny);
      s=1; count=0; 
      pch++;
      print ++p,pch,1,x5,y5,z0,0,0,0;
      for(t=1;t<=n; t++) {	
	  #core parts of one hump
	  #loops for n humps
	  q=w=r=s=z=0;
	  #should run for the last decimal in nested loops
	  for (i=s;i<=n1; i++)print ++p,pch,1,x5+b0*i,y5,z0,0,0,0; ++q; x2=x5+b0*i; y2=y5; ++count; 
	  for (i=q;i<=n2; i++)print ++p,pch,1,x2,y2+b0*i,z0,0,0,0; ++w; y3=y2+b0*i; x3=x2; ++count;
	  for (i=w;i<=n3; i++)print ++p,pch,1,x3+b0*i,y3,z0,0,0,0; ++r; x4=x3+b0*i; y4=y3; ++count;
	  for (i=r;i<=n4; i++)print ++p,pch,1,x4,y4-b0*i,z0,0,0,0; ++s; ++z; y5=y6=y4-b0*i; x5=x6=x4; ++count;
       }
#	 if (count!=tn) { #if floating
#	      n5=tn-count; #get remaining atoms and pin along horizontal
	      #nn5=n5-pph;
	      #loop pph horizontal and nn5 verical for the rest
#	      for (i=z;i<=n5; i++){ 
#		print ++p,pch,1,x6+b0*i,y6,z0,0,0,0; ++zz; x5=x7=x6+b0*i; x5=y7=y6; ++count; }
	    #  for (i=zz;i<=nn5; i++){ #vertical
            #    print ++p,pch,1,x7,y7+b0*i,z0,0,0,0; ++s; x5=x7; y5=y7+b0*i; ++count; }
		#but now printing along horizontal only.
		#check for positon and 
#        } 
print count,tn;

      } 
    }
  }
}
