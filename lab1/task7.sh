#!/bin/bash

grep -rhEsoa '[[:alnum:]\-\_\.]+@[[:alnum:]]+\.[[:alpha:]]+' /etc | tr '\n' ',' > emails.lst

less emails.lst
