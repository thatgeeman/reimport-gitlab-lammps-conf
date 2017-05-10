/* Aim: a caterpillar start configuration
*    ___     ___
*   |   |   |   |
* __|   |___|   |__
*
*future: make inputable files with the arrays written on it.
*/

#include <stdio.h>
#include <math.h>

void main()
{
 //setting array
 int rows=4;
 int columns=13;
 int aRa=rows*columns;
 int i,j;
 int allBlocks[rows][columns];
  for (i=0; i<rows; i++ ) {
	for (j=0; j<columns; j++ ) {
		allBlocks[0][0]=1;
                allBlocks[0][0]=2;
                allBlocks[0][0]=3;
                allBlocks[0][0]=4;
	}
  }

 for (i=0; i<rows; i++ ) {
        for (j=1; j<columns; j++ ) { //j=1
		allBlocks[i][j]=allBlocks[i][j-1]+4; //add 4 to the prev one
	}
 }

 int n=256; // chainlength
 int blockSize=5; //no of bonds in each projection or depression ( horizontal + vertical lines )
 float b0=0.967;   // bond length
 int nx=1; 
 int nz=32; 
 int ny=12; // replication ( quasi-hexagonal lattice in yz-plane )
  //nx*ny*nz=number of chains
 int boxz=40;     
 int boxy=40;
  
 int nBlocks=n/blockSize; //total no of blocks for the whole length of the chain ( vertical + horizontal )
 int prjctdBlocks=0.5334*nBlocks; //53.34% is projected ( counting the horizontal ones )
 float newBlockDistance=prjctdBlocks*b0; //getting the actual distance in horizontal plane by * b0
 int boxx=newBlockDistance+10; //box size setup done, 10 is for safety
 
  
  float xx0=0.0; 
  float yy0=0.0; 
  float zz0=0.0; //origin
  float x0, z0, y0;
  int pch, p, q, col, k, l;

  for (k=0; k<nx; k++) {
    x0 = xx0 + k*(boxx/nx);
     for (l=0; l<nz; l++) {
      z0 = zz0 + (l+0.5*(k%2))*(boxz/nz);
       for (j=0; j<ny; j++) {
       y0 = yy0 + j*(boxy/ny);
       pch++;
       printf("%d %d 1  %f %f %f 0 0 0\n",++p,pch,x0,y0,z0);
	  for (q=1; q<=aRa; q++) { //for each block of 5 bonds
	    for (col=0; col<columns; col++) {
	       if (q == allBlocks[1][col]) { //check if in array
			for (i=1;i<=blockSize;i++){
				if ((q*i)<=n)	printf("%d %d 1 %f %f %f 0 0 0\n",++p,pch,x0+b0*i*q,y0,z0); //first path
			}
		}
               if (q == allBlocks[2][col]) {            
                        for (i=1;i<=blockSize; i++){
 			        if ((q*i)<=n)  printf("%d %d 1 %f %f %f 0 0 0\n",++p,pch,x0,y0+b0*i*q,z0); //second upward path
                        }
                }
               if (q == allBlocks[3][col]) {            
                        for (i=1;i<=blockSize; i++){
				if ((q*i)<=n) printf("%d %d 1 %f %f %f 0 0 0\n",++p,pch,x0+b0*i*q,y0,z0); //third flat
                        }
                }
	       if (q == allBlocks[4][col]) {            
                        for (i=1;i<=blockSize; i++){
                                 if ((q*i)<=n) printf("%d %d 1 %f %f %f 0 0 0\n",++p,pch,x0,y0-b0*i*q,z0); //downward path
                        }
                }
	  } //col loop
 	}  //q loop
      }
    }
  }
}
