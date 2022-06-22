#!/usr/bin/env bash
# func.sh

function plier {
	local mult=1

	for i in $@
	do
		let mult=mult\*$i
	done
	echo "$mult"
}

function isiteven {
	local mod=$1%2
	if [[ $mod -eq 1 ]]
	then
		echo 0
	else
		echo 1
	fi
}

function nevens {
	local nevens=0
	for i in $@
	do
		local num=$(isiteven $i)
		let nevens=nevens+$num
	done
	echo $nevens
}

function howodd {
	local evens=$(nevens $@)
	echo "$evens / $#" | bc -l
}

function fib {
	local num1=0
	local num2=1
	local numfib=$(expr $1 - 1)
	for i in {0..$numfib}
	do
		[[ $i -eq 0 ]] && echo -n $num1
		[[ $i -eq 1 ]] && echo -n $num2
		if [[ $i -gt 1 ]]
		then
			local num=$(expr $num1 + $num2)
			local temp=$num1
			let num1=$num2
			let num2=$num1+$temp
			echo -n $num
		fi
		echo -n ' '
	done
}
