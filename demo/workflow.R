## Copyright 2012 Sebastian Gibb
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


## workflow demo


## load necessary libraries
library("MALDIquant");

## load example spectra
data("spectra", package="MALDIquant");

## sqrt transform (for variance stabilization)
spectra <- lapply(spectra, transformIntensity, sqrt);

## simple 5 point moving average for smoothing spectra
movingAverage <- function(y) {return( filter(y, rep(1, 5)/5, sides=2) );}
spectra <- lapply(spectra, transformIntensity, movingAverage);

## remove baseline
spectra <- lapply(spectra, removeBaseline);

## run peak detection
peaks <- lapply(spectra, detectPeaks);

## align spectra by warping
## 1. create reference peaks (could be done automatically by
##    determineWarpingFunctions)
## 2. calculate individual warping functions
## 3. warp each MassPeaks object
refPeaks <- referencePeaks(peaks);
warpingFunctions <- determineWarpingFunctions(peaks, reference=refPeaks);
peaks <- warpMassPeaks(peaks, warpingFunctions);

## bin peaks
peaks <- binPeaks(peaks);

## merge technical replicates
## 1. create factors for correct assignment
nTechRep <- 2;
samples <- as.factor(rep(1:(length(peaks)/nTechRep), each=nTechRep));

## 2. filter peaks which occur only in one of the replicates
peaks <- filterPeaks(peaks, labels=samples, minFrequency=1);

## 3. merge technical replicates
peaks <- mergeMassPeaks(peaks, labels=samples);

## prepare for statistical analysis
## 1. get cancer/control indices
filenames <- sapply(peaks, function(x)metaData(x)$file[1]);
cancer <- grepl(pattern="/tumor/", x=filenames);
classes <- as.factor(ifelse(cancer, "cancer", "control"));

## 2. filter peaks which occur less across all samples
peaks <- filterPeaks(peaks, minFrequency=1);

## 3. export MassPeaks object as matrix
training <- intensityMatrix(peaks);

## 'training' and 'classes' could now used by any statistical tool e.g. sda
