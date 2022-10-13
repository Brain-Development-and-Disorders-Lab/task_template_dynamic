FROM r-base:4.2.0

ENV R_FORGE_PKGS Rserve
ENV R_CRAN_PKGS Rcpp R6 uuid checkmate mime jsonlite digest config logger

RUN apt-get update && \
    apt-get install -y --no-install-recommends libssl-dev libjemalloc-dev wget && \
    install2.r -r http://www.rforge.net/ $R_FORGE_PKGS && \
    install2.r $R_CRAN_PKGS

# Obtain and install the RestRserve package
ADD https://cran.r-project.org/src/contrib/RestRserve_1.2.1.tar.gz /
RUN R CMD INSTALL /RestRserve*.tar.gz && \
    rm -rf /tmp/RestRserve* && \
    rm /RestRserve*.tar.gz

WORKDIR /

ENV LD_PRELOAD /usr/lib/x86_64-linux-gnu/libjemalloc.so

EXPOSE 8000

# Copy R scripts and start the server
ADD /server /server
WORKDIR /server
CMD ["Rscript" , "start.R"]