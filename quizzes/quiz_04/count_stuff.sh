#!/bin/bash
set -ueo pipefail

$1 | ls -a | wc -l

