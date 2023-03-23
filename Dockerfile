FROM nfcore/base:1.9
LABEL authors="Haibo Liu <haibo.liu@umassmed.edu>" \
      description="Docker image containing all software requirements for the nf-core/epipipes pipeline"

# Install the conda environment
COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/nf-core-epipipes-0.0.1/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name nf-core-epipipes-0.0.1 > nf-core-epipipes-0.0.1.yml
