#!/bin/bash

openssl rand -out ~/.rnd 128
sudo ./check_mme_s6a_certificate /usr/local/etc/oai/freeDiameter mme.ng4T.com
