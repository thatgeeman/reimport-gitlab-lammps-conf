cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c     logaverage.f
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      program logaverage
      implicit none
      character*50 xyinput,xyoutput
      integer   maxline,minbin,maxbin,nrbin
      parameter(maxline=10000000,maxbin=10000)
      real*8    ybin(maxbin),ybin2(maxbin),nbin(maxbin),dbin
      integer   ibin,iline
      real*8    xdat,xlogdat,ydat
      real*8    xmin,xmax,logxmin,logxmax,ymin,ymax
      logical   accepted

      write(*,*) '**********************************************' 
      write(*,*) '* logaverage                                 *'
      write(*,*) '*                                            *'
      write(*,*) '* gets data (x,y) and writes down the data   *'
      write(*,*) '* averaged on logarithmic scale of x         *'
      write(*,*) '*                                            *'
      write(*,*) '* only data xmin <= x <=xmax  considered     *'
c     write(*,*) '*           ymin <= y                        *'
      write(*,*) '*                                            *'
c     write(*,*) '* Note:                                      *'
c     write(*,*) '* ymin=0  for simple histos (event counting) *'
c     write(*,*) '* ymin>0  for msd, correlation functions     *'
      write(*,*) '*                                            *'
      write(*,*) '* Author        : J.P. Wittmer               *'
      write(*,*) '* First Version : 22/JUL/2005                *'
      write(*,*) '* Last  Version : 09/JAN/2018                *'
      write(*,*) '**********************************************' 

      write(*,*) 
      write(*,*) '  1. Parameters'
      write(*,*) 
      write(*,*)   '  xyinput ? :'
      read(*,'(a50)') xyinput
      write(*,*)      xyinput

      write(*,*)   '  xyoutput files ? :'
      read(*,'(a50)') xyoutput
      write(*,*)      xyoutput

      write(*,*) '  xmin,xmax,nrbin ?'
      read(*,*)     xmin,xmax,nrbin
      write(*,*)    xmin,xmax,nrbin

c     write(*,*) '  ymin ? (must be <= 0 for simple histos !)'
c     read(*,*)     ymin
c     write(*,*)    ymin
c     ymin         = 0

      write(*,*) 
      write(*,*) '  2. Setting up bins'

      logxmax      = log(xmax)
      logxmin      = log(xmin)
      dbin         = (logxmax-logxmin)/real(nrbin) 
      write(*,*) '  logxmin = ',logxmin
      write(*,*) '  logxmax = ',logxmax
      write(*,*) '  dbin    = ',dbin
      do ibin       = 1,maxbin
        ybin(ibin)  = 0
        ybin2(ibin) = 0
        nbin(ibin)  = 0
      end do

      write(*,*) 
      write(*,*) '  3. Reading data and averaging'
 
      open(11,file=xyinput,status='old')
      do iline=1,maxline
        read(11,*,end=999) xdat,ydat
        accepted = xdat.ge.xmin.and.xdat.le.xmax
c    &             .and.ydat.gt.ymin
        if(accepted) then
          xlogdat = log(xdat)
          ibin    = anint((xlogdat-logxmin)/dbin) + 1
          if(ibin.le.nrbin) then
            nbin(ibin)  = nbin(ibin) + 1
            ybin(ibin)  = ybin(ibin) + ydat
            ybin2(ibin) = ybin2(ibin) + ydat**2
          endif
        endif
      end do
999   write(*,*) '  numbers of lines read iline = ',iline-1
      close(11)

      open(12,file=xyoutput,status='unknown')
      do ibin = 1,nrbin
        if(nbin(ibin).gt.0) then
          ybin(ibin)  = ybin(ibin)/nbin(ibin)
          ybin2(ibin) = ybin2(ibin)/nbin(ibin)
          ybin2(ibin) = ybin2(ibin)-ybin(ibin)**2
          ybin2(ibin) = ybin2(ibin)**0.5
          write(12,'(3G15.5)') 
c         write(12,'(I5,4G15.5)') 
c    &                  ibin,ibin*dbin,
     &                  exp((ibin-1)*dbin+logxmin),
     &                  ybin(ibin),ybin2(ibin)
        endif  
      end do
      close(12)

      write(*,*) '**********************************************' 
      write(*,*) '*     End of logaverage                      *'
      write(*,*) '**********************************************' 

      end
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
