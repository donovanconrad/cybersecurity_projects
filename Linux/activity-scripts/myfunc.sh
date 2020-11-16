#!/bin/bash

function f {
	typeset A
	A=1
	echo value from f is $A
}

A=2
f
echo value from outside f is $A
