cls
import-module -name ActiveDirectory
get-adcomputer -filter * -properties *|ft Name, enabled, dnshostname, operatingsystem, OperatingSystemServicePack, OperatingSystemVersion -autosize > c:\scripts\ADComputers.txt 