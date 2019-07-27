#!/bin/bash


screen_enb="enb"
screen -dmS $screen_enb
cmd1="~/oaimeta/scripts/enb_start.sh";
screen -x -S $screen_enb -p 0 -X stuff "$cmd1"
screen -x -S $screen_enb -p 0 -X stuff '\n'


screen_ue="ue"
screen -dmS $screen_ue
cmd2="~/oaimeta/scripts/ue_start.sh";
screen -x -S $screen_ue -p 0 -X stuff "$cmd2"
screen -x -S $screen_ue -p 0 -X stuff '\n'

