section .text
bits 32

global switch_to_lm
switch_to_lm:
    cli
    hlt
    ; set up paging | intel sdm vol 3a 5.5

    ; intel sdm vol 3a 11.8.5
    ; prereqs for long mode:

    ; other stuff needed for 

