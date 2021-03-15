#!/usr/bin/env python
# Run GREGOR: Fix conf files, submit drmr commands, compile dataframe and plot 

import os
import argparse
import pandas
import glob


def makedataframe(filename):
    framelist = []
    for name in filename:
        
        job_info = os.path.basename(os.path.dirname(os.path.realpath(name))).replace('output_','')

        df = pandas.read_csv(name, sep='\t')
        df['Bed_File'] = df['Bed_File'].str.replace('.bed','')
        df['fold'] = df['InBed_Index_SNP']/df['ExpectNum_of_InBed_SNP']
        df['job_info'] = job_info
        framelist.append(df)
    outdf = pandas.concat(framelist)
    return outdf
    
if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='Compile dataframe from GREGOR output folders.')
    parser.add_argument('--filename', nargs='+', type=str, help="""The StatisticSummaryFile from GREGOR.""")
    parser.add_argument('--outputfilename', help="""Output file name.""")

    args = parser.parse_args()

    filenames = args.filename
    outputfilename = args.outputfilename

    outdf = makedataframe(filenames)
    
    outdf.to_csv(outputfilename, index=False, sep='\t', na_rep="NA")
