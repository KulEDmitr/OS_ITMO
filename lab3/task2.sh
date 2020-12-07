#!/bin/bash

at -f task1.sh now + 2 minutes 2>/dev/null

tail -n 0 -f ~/report
