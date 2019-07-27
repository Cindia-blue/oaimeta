#!/bin/bash


screen_hss="hss"
screen -dmS $screen_hss
cmd1="~/oaimeta/scripts/hss_start.sh";
screen -x -S $screen_hss -p 0 -X stuff "$cmd1"
screen -x -S $screen_hss -p 0 -X stuff '\n'


screen_mme="mme"
screen -dmS $screen_mme
cmd2="~/oaimeta/scripts/mme_start.sh";
screen -x -S $screen_mme -p 0 -X stuff "$cmd2"
screen -x -S $screen_mme -p 0 -X stuff '\n'

screen_c="spgwc"
screen -dmS $screen_c
cmd3="~/oaimeta/scripts/c_start.sh";
screen -x -S $screen_c -p 0 -X stuff "$cmd3"
screen -x -S $screen_c -p 0 -X stuff '\n'

screen_u="spgwu"
screen -dmS $screen_u
cmd3="~/oaimeta/scripts/u_start.sh";
screen -x -S $screen_u -p 0 -X stuff "$cmd4"
screen -x -S $screen_u -p 0 -X stuff '\n'
