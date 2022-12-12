#!/bin/sh -e

source $(dirname $0)/../utils.sh

sh <(http_get get.chezmoi.io)

