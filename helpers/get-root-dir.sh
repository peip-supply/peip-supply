#!/usr/bin/env bash

function getRootDir {
	expr "$( cd "$( dirname "${BASH_SOURCE[0]}")/.." && pwd )";
}
