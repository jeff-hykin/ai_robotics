sudo mkdir -p /etc/local/src                         && \
$ cd /etc/local/src                                  && \
$ sudo git clone https://github.com/patjak/bcwc_pcie.git  && \
$ cd bcwc_pcie                                       && \
$ sudo make                                          && \
$ sudo make install                                  && \
$ cd ..                                              && \
$ sudo make                                          && \
$ sudo install                                       && \
$ sudo depmod                                        && \
$ sudo modprobe -r bdc_pci                           && \
$ sudo modprobe facetimehd