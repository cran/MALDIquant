## $Id: empty-methods.R 474 2011-03-20 07:31:56Z sgibb $
##
## Copyright 2011 Sebastian Gibb
## <mail@sebastiangibb.de>
##
## This file is part of MALDIquant for R and related languages.
##
## MALDIquant is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## MALDIquant is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with MALDIquant. If not, see <http://www.gnu.org/licenses/>

## AbstractSpectrumData 
setMethod(f="isEmpty",
    signature=signature(x="AbstractSpectrumData"),
    definition=function(x) {
    
    return(length(x@intensity)==0);
});
