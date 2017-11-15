FROM perl

RUN apt-get update
RUN apt-get install -y build-essential
RUN cpan -i App::cpanminus
RUN cpanm -n PAR::Packer
RUN cpanm -n Graph::Easy

COPY graphgen.pl /build/graphgen.pl
WORKDIR /build

RUN pp -o graphgen graphgen.pl

CMD "bash"
