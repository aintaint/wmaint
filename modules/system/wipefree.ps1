cipher /w:C:

# MFT
# shellbags

<#

https://github.com/ariccio/clean-ntfs-mft-with-undocumented-code

https://learn.microsoft.com/en-us/sysinternals/downloads/contig


First, check how many files Recuva reports that can be recovered. Say it is 1001.
Open a command window and create a temporary directory. Change to that directory.

MKDIR C:\TempReco
CD C:\TempReco

Create at least 1001 files in this directory using the command below with proper parameters.

FOR /L %i in (1,1,1001) do echo willdelete>file%i.tmp

#>