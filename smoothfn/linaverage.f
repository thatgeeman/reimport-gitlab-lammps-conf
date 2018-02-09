cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c     linaverage.f
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      program linaverage
      implicit none
      character*50 xyinput,xyoutput
      integer   maxline,minbin,maxbin,nrbin
      parameter(maxline=1000000,maxbin=1000)
      real*8    ybin(-maxbin:maxbin),nbin(-maxbin:maxbin),dbin
      integer   ibin,iline
      real*8    xdat,ydat
      real*8    xmin,xmax,ymin,ymax
      logical   accepted

      write(*,*) '***************************************************' 
      write(*,*) '* linaverage                                      *'
      write(*,*) '*                                                 *'
      write(*,*) '* gets data (x,y) and writes down averaged data   *'
      write(*,*) '*                                                 *'
      write(*,*) '* Author        : J.P. Wittmer                    *'
      write(*,*) '* First Version : 20/NOV/2008                     *'
      write(*,*) '* Last  Version : 23/OCT/2015                     *'
      write(*,*) '***************************************************' 

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

      write(*,*) 
      write(*,*) '  2. Setting up bins'

      dbin         = (xmax-xmin)/real(nrbin) 
      write(*,*) '  dbin    = ',dbin
      do ibin      = -maxbin,maxbin
        ybin(ibin) = 0
        nbin(ibin) = 0
      end do

      write(*,*) 
      write(*,*) '  3. Reading data and averaging'
 
      open(11,file=xyinput,status='old')
      do iline=1,maxline
c       write(*,*) iline
        read(11,*,end=999) xdat,ydat
        accepted = xdat.ge.xmin.and.xdat.le.xmax
c    &             .and.ydat.gt.ymin
        if(accepted) then
          ibin = anint(xdat/dbin)
          if(abs(ibin).le.maxbin) then
            nbin(ibin) = nbin(ibin) + 1
            ybin(ibin) = ybin(ibin) + ydat
          endif
        endif
      end do
999   write(*,*) '  numbers of lines read iline = ',iline-1
      close(11)

      open(12,file=xyoutput,status='unknown')
      do ibin = -maxbin,maxbin
        if(nbin(ibin).gt.0) then
          ybin(ibin) = ybin(ibin)/nbin(ibin)
          write(12,'(3G15.5)') ibin*dbin,ybin(ibin),nbin(ibin)
        endif  
      end do
      close(12)

      write(*,*) '**********************************************' 
      write(*,*) '*     End of linaverage                      *'
      write(*,*) '**********************************************' 

      end
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
